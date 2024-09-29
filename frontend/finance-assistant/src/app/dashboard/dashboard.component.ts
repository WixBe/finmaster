// dashboard.component.ts
import { CommonModule, NgClass, NgFor } from '@angular/common';
import { Component, ComponentFactoryResolver, Injector, OnInit } from '@angular/core';
import { NavbarComponent } from '../navbar/navbar.component';
import { GoalService } from '../services/goal.service';
import { UserService } from '../services/user.service';
import { Transaction } from '../models/transactions';
import { animate, style, transition, trigger } from '@angular/animations';
import { GoalDto } from '../models/goal.dto';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
  imports:[NgClass, NgFor, CommonModule],
  animations: [
    trigger('slideInOut', [
      transition(':enter', [
        style({transform: 'translateY(-100%)'}),
        animate('200ms ease-in', style({transform: 'translateY(0%)'}))
      ]),
      transition(':leave', [
        animate('200ms ease-in', style({transform: 'translateY(-100%)'}))
      ])
    ])
  ]
})

export class DashboardComponent implements OnInit {

  user: any;
  accountBalance: number = 0;  // Store account balance
  transactions: Transaction[] = [];
  goals: any[] = [];
  totalBudget: number = 0;
  expanded: boolean = false;
  safety: boolean = true;

  private accountBalanceFetched = false;  // New variable to track balance fetching
  private totalBudgetFetched = false;    // New variable to track budget fetching


  constructor(private componentFactoryResolver: ComponentFactoryResolver, private injector: Injector, private userService: UserService, private goalService: GoalService) {}

  ngOnInit(): void {

    this.user = this.userService.getUserDetails();
    // Ensure user details are available
    if (this.user && this.user.accountNumber) {
      // Fetch account balance using the accountNumber
      this.getAccountBalance(this.user.accountNumber);

      // Load transactions and goals
      this.loadTransactions();
      this.loadGoals();
    } else {
      console.error('User details not found or account number missing');
    }

    // Initialize the navbar
    const navbarComponentRef = this.componentFactoryResolver.resolveComponentFactory(NavbarComponent);
    const navbarComponentInstance = navbarComponentRef.create(this.injector);
    navbarComponentInstance.instance.ngOnInit();
  }

  // Method to check safety based on account balance and total budget
  checkSafety(): void {
    if (this.accountBalanceFetched && this.totalBudgetFetched) {
      this.safety = this.accountBalance > this.totalBudget;
    }
  }

  // Method to fetch the account balance
  getAccountBalance(accountNumber: string): void {
    this.userService.getAccount(accountNumber).subscribe(
      (accountData) => {
        this.accountBalance = accountData.accountBalance;  // Store account balance
        console.log('Account Balance:', this.accountBalance);
      },
      (error) => {
        console.error('Error fetching account balance:', error);
      }
    );
  }

  loadTransactions(): void {
    this.userService.getTransactions(this.user.accountNumber).subscribe(
      (transactions) => {
        console.log('Transactions from API:', transactions); // Check the API response here
        this.transactions = transactions; // Assign API response to the transactions array
        this.userService.setUserDetails(this.user);  // Update local storage with transactions
      },
      (error) => {
        console.error('Error fetching transactions:', error);
      }
    );
  }
  

  // Method to load goals and calculate total budget
  loadGoals(): void {
    this.goalService.getAllGoals().subscribe(
      (goals) => {
        // Filter goals by user's account number
        this.goals = goals.filter((goal) => goal.accountNumber === this.user.accountNumber);

        // Calculate the total budget by summing goal values (e.g., targetAmount)
        this.totalBudget = this.goals.reduce((sum, goal) => sum + (goal.value || 0), 0);
        console.log('Total Budget:', this.totalBudget);
        this.checkSafety();  // Check safety after the total budget is updated
      },
      (error) => {
        console.error('Error fetching goals:', error);
      }
    );
  }

  // Toggle the transaction display state
  toggleTransactions(): void {
    this.expanded = !this.expanded;
  };

  calculateDaysLeft(goal: GoalDto): number {
    const currentDate = new Date();
    const createdDate = new Date(goal.startDate);
    const endDate = new Date(createdDate.setMonth(createdDate.getMonth() + goal.durationInMonths));
    
    // Calculate the difference in time
    const timeDiff = endDate.getTime() - currentDate.getTime();
    const daysLeft = Math.ceil(timeDiff / (1000 * 3600 * 24));  // Convert time to days

    return daysLeft >= 0 ? daysLeft : 0;  // Return 0 if the goal has passed
  }

}

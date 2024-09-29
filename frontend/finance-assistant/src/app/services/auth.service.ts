import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { BehaviorSubject } from "rxjs";
import { Location } from "@angular/common";

@Injectable({
    providedIn: 'root'
})

export class AuthService {

    // BehaviorSubject for login status
    loggedIn = new BehaviorSubject<boolean>(false);
    authStatus = this.loggedIn.asObservable();

    constructor(private router: Router, private location: Location) {
        //this.checkLoginStatusOnInit(); // Check login status on app initialization
    }

    // Check if localStorage is available
    private isLocalStorageAvailable(): boolean {
        try {
            return typeof window !== 'undefined' && typeof localStorage !== 'undefined';
        } catch (e) {
            return false;
        }
    }

    // Check if the user is logged in by checking the token in localStorage
    checkLoginStatusOnInit() {
        if (this.isLocalStorageAvailable()) {
            const token = localStorage.getItem('token');
            if (token) {
                this.loggedIn.next(true); // Set loggedIn to true if token exists
            }
        }
    }

    // Check if the user is logged in by checking the token in localStorage
    checkLoginStatus(): boolean {
        const token = localStorage.getItem('token');
        return !!token;  // Return true if token exists
    }

    login() {
        this.loggedIn.next(true); // Update the BehaviorSubject to notify subscribers
      }

    // Logout method to clear the token and reset login state
    logout() {
        if (typeof localStorage !== 'undefined') {
          localStorage.removeItem('token');
        }
        this.loggedIn.next(false);
        
        // Navigate to home and replace the current URL in the history
        this.router.navigate(['/home'], { replaceUrl: true }).then(() => {
            // Optionally, navigate to the login page or any other safe page
            this.router.navigate(['/login'], { replaceUrl: true });  // This replaces the current state in history
        });
      }

    // Utility function to check if the token is present in localStorage
    isLoggedIn(): boolean {
        if (this.isLocalStorageAvailable()) {
            return !!localStorage.getItem('token'); // Return true if token exists
        }
        return false;
    }
}

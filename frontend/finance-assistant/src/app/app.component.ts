import { Component, HostListener } from '@angular/core';
import { Router, RouterOutlet } from '@angular/router';
import { NavbarComponent } from './navbar/navbar.component';
// ng add @angular/material
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { LoginComponent } from './login/login.component';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, NavbarComponent, MatDialogModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'finance-assistant';

  constructor(private router: Router, private authService: AuthService) {}

  @HostListener('window:popstate', ['$event'])
  onPopState(event: Event) {
    if (!this.authService.isLoggedIn()) {
      this.router.navigate(['/home']); // Redirect to home if not logged in
    }
  }
  
}

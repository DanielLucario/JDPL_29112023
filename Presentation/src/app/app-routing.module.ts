import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { StudentsComponent } from './components/students/students.component';
import { SubjectsComponent } from './components/subjects/subjects.component';
import { RegisterSubjectsComponent } from './components/register-subjects/register-subjects.component';
import { HomeComponent } from './components/home/home.component';
import { authGuard } from './guards/auth.guard';

const routes: Routes = [
  { path: "login", component: LoginComponent },
  { path: "home", component: HomeComponent, canActivate: [authGuard] },
  { path: "students", component: StudentsComponent, canActivate: [authGuard] },
  { path: "students/:id", component: RegisterSubjectsComponent, canActivate: [authGuard] },
  { path: "subjects", component: SubjectsComponent, canActivate: [authGuard] },
  { path: "**", redirectTo: "login" }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

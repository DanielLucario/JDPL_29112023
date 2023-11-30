import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environments';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient, private router: Router) { }

  public login(nombre: string, apellidoPaterno: string) {
    this.http.post(environment.host + '/Auth/login', {
      nombre, apellidoPaterno
    }).subscribe((data: any) => {
      if (data.result) {
        localStorage.setItem('isLogged', 'true')
        this.router.navigate(['home'])
      } else {
        alert('Acceso denegado')
      }
    })
  }
}

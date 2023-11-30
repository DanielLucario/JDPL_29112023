import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { AuthService } from 'src/app/services/auth/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  constructor(
    private authService: AuthService,
    private formBuilder: FormBuilder
  ) {
    localStorage.clear()
  }

  form = this.formBuilder.group({
    nombre: ['', [Validators.required, Validators.pattern('[a-zA-ZÀ-ÿ ]*')]],
    apellidoPaterno: ['', [Validators.required, Validators.pattern('[a-zA-ZÀ-ÿ\' ]*')]]
  });


  public login() {
    if (this.form.valid) {
      const nombre: string = this.form.value.nombre?.trim() ?? ''
      const apellidoPaterno: string = this.form.value.apellidoPaterno?.trim() ?? ''
      this.authService.login(nombre, apellidoPaterno)
    } else {
      alert('El formulario no es valido')
    }
  }
}

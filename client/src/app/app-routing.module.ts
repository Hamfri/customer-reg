import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AccountsModule } from './modules/accounts/accounts.module';
import { PagesModule } from './modules/pages/pages.module';

const routes: Routes = [
  { path: 'accounts', loadChildren: () => AccountsModule },
  { path: '', loadChildren: () => PagesModule },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

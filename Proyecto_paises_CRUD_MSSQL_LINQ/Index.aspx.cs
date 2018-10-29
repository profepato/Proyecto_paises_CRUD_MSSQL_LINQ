using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_paises_CRUD_MSSQL_LINQ {
    


    public partial class Index : System.Web.UI.Page {

        private BD_PaisesDataContext db;

        protected void Page_Load(object sender, EventArgs e) {
            db = new BD_PaisesDataContext();

            btnEliminar.Visible = false;
            btnModificar.Visible = false;
            btnRegPais.Visible = true;
        }

        protected void btnRegPais_Click(object sender, EventArgs e) {
            Pais p = new Pais();
            p.nombre = txtPais.Text;

            db.Pais.InsertOnSubmit(p);
            db.SubmitChanges();

            gridPaises.DataBind();
            txtPais.Text = "";
        }

        protected void gridPaises_SIC(object sender, EventArgs e) {
            btnEliminar.Visible = true;
            btnModificar.Visible = true;
            btnRegPais.Visible = false;

            String id = gridPaises.SelectedRow.Cells[1].Text;
            Pais p = db.Pais.Where(pa => pa.id == int.Parse(id)).FirstOrDefault();

            txtPais.Text = p.nombre;
        }

        protected void btnEliminar_Click(object sender, EventArgs e) {
            String id = gridPaises.SelectedRow.Cells[1].Text;

            Pais p = db.Pais.Where(pa => pa.id == int.Parse(id)).FirstOrDefault();

            db.Pais.DeleteOnSubmit(p);
            db.SubmitChanges();

            btnEliminar.Visible = false;
            btnModificar.Visible = false;
            btnRegPais.Visible = true;

            gridPaises.DataBind();
            gridPaises.SelectedIndex = -1;
            txtPais.Text = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e) {
            btnEliminar.Visible = false;
            btnModificar.Visible = false;
            btnRegPais.Visible = true;
            

            gridPaises.DataBind();
            gridPaises.SelectedIndex = -1;
            txtPais.Text = "";
        }

        protected void btnActualizar_Click(object sender, EventArgs e) {
            String id = "" + gridPaises.SelectedRow.Cells[1].Text;
            Pais p = db.Pais.Where(pa => pa.id == int.Parse(id)).FirstOrDefault();

            p.nombre = txtPais.Text;
            db.SubmitChanges();

            gridPaises.DataBind();
            gridPaises.SelectedIndex = -1;
            txtPais.Text = "";
        }

        protected void btnBuscar_Click(object sender, EventArgs e) {
            String filtro = txtBuscar.Text;
            dsPaises.SelectCommand = "SELECT * FROM Pais " +
                "WHERE nombre LIKE '%"+ filtro + "%'";
        }
    }
}
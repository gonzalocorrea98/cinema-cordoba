using CineBack.dominio;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CineFront
{
    public partial class frmAgregarComprobante : Form
    {
        private Comprobante comprobanteCargado = null;
        

        public frmAgregarComprobante()
        {
            InitializeComponent();
            btnAceptar.Show();
            btnEditar.Hide();
        }

        public frmAgregarComprobante(Comprobante comprobanteCargado)
        {
            InitializeComponent();
            this.comprobanteCargado = comprobanteCargado;
            btnAceptar.Hide();
            btnEditar.Show();
        }

        private async void frmAgregarEntrada_Load(object sender, EventArgs e)
        {
            txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtPrecio.Text = 200.ToString();

            //COMBO FUNCION
            string jsonfunciones = await GetHttp("https://localhost:44301/funciones");
            var lstfunciones = JsonConvert.DeserializeObject<List<Funcion>>(jsonfunciones);
            cboFuncion.DataSource = lstfunciones;
            cboFuncion.ValueMember = "IdFuncion";
            cboFuncion.DisplayMember = "Descripcion";
            cboFuncion.DropDownStyle = ComboBoxStyle.DropDownList;
            cboFuncion.SelectedIndex = -1;

            //COMBO CLIENTES
            string jsonclientes = await GetHttp("https://localhost:44301/clientes");
            var lstClientes = JsonConvert.DeserializeObject<List<Cliente>>(jsonclientes);
            cboCliente.DataSource = lstClientes;
            cboCliente.ValueMember = "IdCliente";
            cboCliente.DisplayMember = "Nombre";
            cboCliente.DropDownStyle = ComboBoxStyle.DropDownList;
            cboCliente.SelectedIndex = -1;

            //COMBO FORMA PAGO
            string jsonFormaPagos = await GetHttp("https://localhost:44301/formaPago");
            var lstFormaPagos = JsonConvert.DeserializeObject<List<FormaPago>>(jsonFormaPagos);
            cboFormaPago.DataSource = lstFormaPagos;
            cboFormaPago.ValueMember = "IdFormaPago";
            cboFormaPago.DisplayMember = "Descripcion";
            cboFormaPago.DropDownStyle = ComboBoxStyle.DropDownList;
            cboFormaPago.SelectedIndex = -1;

            //COMBO FORMA COMPRA
            string jsonFormacompras = await GetHttp("https://localhost:44301/formaCompra");
            var lstFormacompras = JsonConvert.DeserializeObject<List<FormaCompra>>(jsonFormacompras);
            cboFormaCompra.DataSource = lstFormacompras;
            cboFormaCompra.ValueMember = "IdFormaCompra";
            cboFormaCompra.DisplayMember = "Descripcion";
            cboFormaCompra.DropDownStyle = ComboBoxStyle.DropDownList;
            cboFormaCompra.SelectedIndex = -1;


            if (comprobanteCargado != null)     //cargar datos de la pelicula seleccionada
            {
                txtFecha.Text = comprobanteCargado.Fecha.ToString();
                cboCliente.SelectedValue = comprobanteCargado.IdCliente;
                cboFormaCompra.SelectedValue = comprobanteCargado.IdFormaCompra;
                cboFormaPago.SelectedValue = comprobanteCargado.IdFormaPago;
            }
        }

        //************************************* METODOS *************************************

        //GET
        public async Task<string> GetHttp(string url)
        {
            WebRequest oRequest = WebRequest.Create(url);
            WebResponse oResponse = oRequest.GetResponse();
            StreamReader sr = new StreamReader(oResponse.GetResponseStream());
            return await sr.ReadToEndAsync();
        }

        //private async void CargarProductosAsync()
        //{
        //    string url = "http://localhost:5031/productos";
        //    var result = await ClientSingleton.GetInstance().GetAsync(url);
        //    var lst = JsonConvert.DeserializeObject<List<Producto>>(result);
        //    cboProductos.DataSource = lst;
        //    cboProductos.DisplayMember = "Nombre";
        //    cboProductos.ValueMember = "ProductoNro";
        //}

        //POST

        //PUT

        //************************************* BOTONES *************************************

        //AGREGAR

        //EDITAR

        //CANCELAR
        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
            frmComprobantes comprobantes = new frmComprobantes();
            comprobantes.Show();
        }

        //SALIR
        private void label6_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Está por cerrar la aplicación.", "SALIR", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button2) == DialogResult.OK)
                Application.Exit();
        }


        [DllImport("user32.Dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.Dll", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);

        private void frmAgregarEntrada_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void label1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void txtPrecio_KeyPress(object sender, KeyPressEventArgs e)
        {
            if((e.KeyChar >= 32 && e.KeyChar <= 47) || (e.KeyChar >=58 && e.KeyChar <= 255))
            {
                MessageBox.Show("Sólo Números.", "ALERTA", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                e.Handled = true;
                return; 
            }
        }

        
    }
}

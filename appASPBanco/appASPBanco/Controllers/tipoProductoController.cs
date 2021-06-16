using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using appASPBanco.Models;

namespace appASPBanco.Controllers
{
    public class tipoProductoController : Controller
    {
        private Banco db = new Banco();

        // GET: tipoProducto
        public ActionResult Index()
        {
            return View(db.tipoProducto.ToList());
        }

        // GET: tipoProducto/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipoProducto tipoProducto = db.tipoProducto.Find(id);
            if (tipoProducto == null)
            {
                return HttpNotFound();
            }
            return View(tipoProducto);
        }

        // GET: tipoProducto/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tipoProducto/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idTipoProducto,nombreTipoProducto,estatus")] tipoProducto tipoProducto)
        {
            if (ModelState.IsValid)
            {
                db.tipoProducto.Add(tipoProducto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tipoProducto);
        }

        // GET: tipoProducto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipoProducto tipoProducto = db.tipoProducto.Find(id);
            if (tipoProducto == null)
            {
                return HttpNotFound();
            }
            return View(tipoProducto);
        }

        // POST: tipoProducto/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idTipoProducto,nombreTipoProducto,estatus")] tipoProducto tipoProducto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoProducto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tipoProducto);
        }

        // GET: tipoProducto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipoProducto tipoProducto = db.tipoProducto.Find(id);
            if (tipoProducto == null)
            {
                return HttpNotFound();
            }
            return View(tipoProducto);
        }

        // POST: tipoProducto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tipoProducto tipoProducto = db.tipoProducto.Find(id);
            db.tipoProducto.Remove(tipoProducto);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

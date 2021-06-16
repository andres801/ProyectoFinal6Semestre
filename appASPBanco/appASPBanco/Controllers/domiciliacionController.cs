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
    public class domiciliacionController : Controller
    {
        private Banco db = new Banco();

        // GET: domiciliacion
        public ActionResult Index()
        {
            return View(db.domiciliacion.ToList());
        }

        // GET: domiciliacion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            domiciliacion domiciliacion = db.domiciliacion.Find(id);
            if (domiciliacion == null)
            {
                return HttpNotFound();
            }
            return View(domiciliacion);
        }

        // GET: domiciliacion/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: domiciliacion/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idDomiciliacion,descriptionDomiciliacion,montoDomiciliacion,idServicio,idProducto,estatus")] domiciliacion domiciliacion)
        {
            if (ModelState.IsValid)
            {
                db.domiciliacion.Add(domiciliacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(domiciliacion);
        }

        // GET: domiciliacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            domiciliacion domiciliacion = db.domiciliacion.Find(id);
            if (domiciliacion == null)
            {
                return HttpNotFound();
            }
            return View(domiciliacion);
        }

        // POST: domiciliacion/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idDomiciliacion,descriptionDomiciliacion,montoDomiciliacion,idServicio,idProducto,estatus")] domiciliacion domiciliacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(domiciliacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(domiciliacion);
        }

        // GET: domiciliacion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            domiciliacion domiciliacion = db.domiciliacion.Find(id);
            if (domiciliacion == null)
            {
                return HttpNotFound();
            }
            return View(domiciliacion);
        }

        // POST: domiciliacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            domiciliacion domiciliacion = db.domiciliacion.Find(id);
            db.domiciliacion.Remove(domiciliacion);
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

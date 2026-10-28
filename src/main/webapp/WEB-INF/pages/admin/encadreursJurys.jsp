<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace administrateur <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Encadreurs &amp; jurys</span></p>
      <div class="flex items-center gap-2">
        <span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-sm font-medium">${fn:substring(sessionScope.ConnectedUser.prenomuser,0,1)}${fn:substring(sessionScope.ConnectedUser.nomuser,0,1)}</span>
      </div>
    </div>
    <div class="px-8 pt-6">
      <c:if test="${param.info == 'encadreurAjoute'}">
        <div class="rounded-lg border border-[#C9DCC0] bg-[#EFF5EA] text-[#3F6134] px-4 py-3 text-sm">L'encadreur a bien été enregistré dans la base de données.</div>
      </c:if>
      <c:if test="${param.info == 'encadreurModifie'}">
        <div class="rounded-lg border border-[#C9DCC0] bg-[#EFF5EA] text-[#3F6134] px-4 py-3 text-sm">Les informations de l'encadreur ont été mises à jour.</div>
      </c:if>
      <c:if test="${param.info == 'encadreurSupprime'}">
        <div class="rounded-lg border border-[#C9DCC0] bg-[#EFF5EA] text-[#3F6134] px-4 py-3 text-sm">L'encadreur a été supprimé.</div>
      </c:if>
      <c:if test="${param.info == 'encadreurIntrouvable'}">
        <div class="rounded-lg border border-[#E8D9B8] bg-[#FBF5E7] text-[#8A6A2F] px-4 py-3 text-sm">Encadreur introuvable : aucune suppression effectuée.</div>
      </c:if>
      <c:if test="${param.info == 'enregistrementImpossible'}">
        <div class="rounded-lg border border-[#E8C8CF] bg-[#FBEEF1] text-[#A4485E] px-4 py-3 text-sm">Enregistrement impossible : vérifiez le matricule (déjà utilisé ?) et les champs obligatoires.</div>
      </c:if>
      <c:if test="${param.info == 'suppressionImpossible'}">
        <div class="rounded-lg border border-[#E8C8CF] bg-[#FBEEF1] text-[#A4485E] px-4 py-3 text-sm">Suppression impossible : cet encadreur est encore référencé par une autre donnée.</div>
      </c:if>
    </div>
    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Votre espace, en un coup d'œil</p>
      <div class="flex items-end justify-between mb-8">
        <div><h1 class="text-3xl font-medium text-[#2F3A2F]">Encadreurs &amp; jurys</h1>
        <p class="text-sm text-[#6E6D5F] mt-1">Les expertises qui accompagnent vos étudiants.</p></div>
        <div class="flex gap-3">
          <button class="border border-[#E3E1D6] bg-white rounded-lg px-4 py-2.5 text-sm">Exporter</button>
          <button type="button" onclick="openModal('modalEncadreur')" class="bg-[#2F5B45] text-white rounded-lg px-4 py-2.5 text-sm">+ Ajouter un encadreur</button>
        </div>
      </div>
      <form action="${pageContext.request.contextPath}/administrateur" method="get"><input type="hidden" name="page" value="encadreursJurys"><input name="q" value="${param.q}" placeholder="Rechercher un encadreur..." class="border border-[#E3E1D6] bg-white rounded-lg px-3 py-2.5 text-sm w-96 outline-none mb-6"></form>
      <div class="grid md:grid-cols-3 gap-5">
        <c:forEach var="en" items="${enseignants}">
        <div class="bg-white rounded-xl border border-[#ECEEE6] p-6">
          <span class="w-14 h-14 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center mb-4">${fn:substring(en.prenomuser,0,1)}${fn:substring(en.nomuser,0,1)}</span>
          <p class="font-medium text-[#2F3A2F]">${en.nomuser} ${en.prenomuser}</p>
          <p class="mt-1 inline-block bg-[#E7EFDF] text-[#5B7A4A] rounded px-2 py-0.5 text-xs">${en.specialiteLib}</p>
          <p class="text-sm text-[#6E6D5F] mt-4">${en.emailuser}</p>
          <p class="text-sm text-[#9A9886] mt-3 flex items-center gap-2">${en.nbEtudiants} étudiants encadrés</p>
          <a href="${pageContext.request.contextPath}/administrateur?page=soutenances&enseignant=${en.matriculEns}" class="block text-center mt-5 w-full border border-[#E3E1D6] rounded-lg py-2.5 text-sm hover:border-[#5B7A4A]">Consulter les soutenances →</a>
          <div class="flex justify-between mt-3 text-xs">
            <a href="${pageContext.request.contextPath}/administrateur?page=encadreursJurys&modifier=${en.matriculEns}" class="text-[#5B7A4A] hover:underline">Modifier</a>
            <form action="${pageContext.request.contextPath}/administrateur?page=encadreursJurys" method="post">
              <input type="hidden" name="action" value="deleteEnseignant">
              <input type="hidden" name="matricule" value="${en.matriculEns}">
              <button type="submit" class="text-[#B05B74] hover:underline" onclick="return confirm('Supprimer cet encadreur ?');">Supprimer</button>
            </form>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>


<!-- Modal : Ajouter un encadreur -->
<div id="modalEncadreur" class="fixed inset-0 bg-[#1D2E22]/40 flex items-center justify-center p-6 z-50 hidden">
  <div class="bg-white rounded-2xl shadow-xl max-w-lg w-full p-8">
    <div class="flex items-start justify-between mb-6">
      <span class="w-11 h-11 rounded-lg bg-[#E7EFDF] flex items-center justify-center"><svg class="w-5 h-5 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><circle cx="12" cy="8" r="4"/><path d="M4 21c0-4 3.6-6 8-6s8 2 8 6"/></svg></span>
      <button type="button" onclick="closeModal('modalEncadreur')" class="text-[#9A9886] hover:text-[#2F3A2F] text-xl leading-none">×</button>
    </div>
    <h2 class="text-2xl font-medium text-[#2F3A2F] mb-1">${editEnseignant != null ? 'Modifier un encadreur' : 'Ajouter un encadreur'}</h2>
    <p class="text-sm text-[#6E6D5F] mb-6">Complétez les informations de l'encadreur.</p>
    <form action="${pageContext.request.contextPath}/administrateur?page=encadreursJurys" method="post" class="flex flex-col gap-4">
      <input type="hidden" name="action" value="${editEnseignant != null ? 'updateEnseignant' : 'ajouter'}">
      <div class="grid grid-cols-2 gap-4">
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Nom</label><input name="nom" required value="${editEnseignant != null ? editEnseignant.nomuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Prénom</label><input name="prenom" required value="${editEnseignant != null ? editEnseignant.prenomuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      </div>
      <div class="grid grid-cols-2 gap-4">
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Matricule</label><input name="matricule" required placeholder="ENS004" value="${editEnseignant != null ? editEnseignant.matriculEns : ''}" ${editEnseignant != null ? 'readonly' : ''} class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Spécialité</label><select name="id_specialite" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm"><c:forEach var="sp" items="${specialites}"><option value="${sp[0]}" ${editEnseignant != null && editEnseignant.specialite == sp[0] ? 'selected' : ''}>${sp[1]}</option></c:forEach></select></div>
      </div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Email</label><input type="email" name="email" value="${editEnseignant != null ? editEnseignant.emailuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Contact</label><input name="contact" value="${editEnseignant != null ? editEnseignant.contactuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Adresse</label><input name="adresse" value="${editEnseignant != null ? editEnseignant.adresseuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      <div class="flex justify-end gap-3 mt-4 pt-5 border-t border-[#F1F2EC]">
        <button type="button" onclick="closeModal('modalEncadreur')" class="border border-[#E3E1D6] rounded-lg px-5 py-2.5 text-sm">Annuler</button>
        <button type="submit" class="bg-[#2F5B45] text-white rounded-lg px-5 py-2.5 text-sm">✓ Enregistrer</button>
      </div>
    </form>
  </div>
</div>

<c:if test="${editEnseignant != null}"><script>window.addEventListener('load', function(){ openModal('modalEncadreur'); });</script></c:if>
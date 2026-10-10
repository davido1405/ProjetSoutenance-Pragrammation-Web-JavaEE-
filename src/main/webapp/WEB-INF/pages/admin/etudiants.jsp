<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace administrateur <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Étudiants</span></p>
      <div class="flex items-center gap-5">
        <span class="text-sm text-[#6E6D5F] border border-[#E3E1D6] rounded-md px-3 py-1.5">2024 — 2025</span>
        <div class="flex items-center gap-2">
          <span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-sm font-medium">${sessionScope.ConnectedUser.prenomuser.substring(0,1)}${sessionScope.ConnectedUser.nomuser.substring(0,1)}</span>
          <div><p class="text-sm font-medium text-[#2F3A2F]">${sessionScope.ConnectedUser.nomuser} ${sessionScope.ConnectedUser.prenomuser}</p><p class="text-xs text-[#9A9886]">Administrateur</p></div>
        </div>
      </div>
    </div>

    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Votre espace, en un coup d'œil</p>
      <div class="flex items-end justify-between mb-8">
        <div>
          <h1 class="text-3xl font-medium text-[#2F3A2F]">Étudiants</h1>
          <p class="text-sm text-[#6E6D5F] mt-1">Gérez les parcours et les projets de vos étudiants.</p>
        </div>
        <div class="flex gap-3">
          <button class="border border-[#E3E1D6] bg-white rounded-lg px-4 py-2.5 text-sm">Exporter</button>
          <button type="button" onclick="openModal('modalEtudiant')" class="bg-[#2F5B45] text-white rounded-lg px-4 py-2.5 text-sm">+ Ajouter un étudiant</button>
        </div>
      </div>

      <div class="bg-white rounded-xl border border-[#ECEEE6] p-6">
        <div class="flex items-center justify-between mb-5">
          <h3 class="text-lg font-medium text-[#2F3A2F]">Répertoire des étudiants <span class="text-xs bg-[#F1F0E8] text-[#6E6D5F] rounded px-1.5 py-0.5 align-middle">${etudiants.size()}</span></h3>
          <form action="${pageContext.request.contextPath}/administrateur" method="get">
            <input type="hidden" name="page" value="etudiants">
            <input name="q" value="${param.q}" placeholder="Nom ou matricule..." class="border border-[#E3E1D6] rounded-lg px-3 py-2.5 text-sm w-72 outline-none">
          </form>
        </div>
        <table class="w-full text-sm">
          <thead><tr class="text-left text-xs tracking-widest uppercase text-[#9A9886] border-b border-[#ECEEE6]">
            <th class="pb-3 font-medium">Étudiant</th><th class="pb-3 font-medium">Matricule</th><th class="pb-3 font-medium">Filière</th><th class="pb-3 font-medium">Encadreur</th><th class="pb-3 font-medium">Statut</th>
          </tr></thead>
          <tbody class="text-[#2F3A2F]">
            <c:forEach var="e" items="${etudiants}">
            <tr class="border-b border-[#F1F2EC]">
              <td class="py-4 flex items-center gap-3"><span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-xs">${e.prenomuser.substring(0,1)}${e.nomuser.substring(0,1)}</span><div><p class="font-medium">${e.nomuser} ${e.prenomuser}</p><p class="text-xs text-[#9A9886]">${e.emailuser}</p></div></td>
              <td>${e.matriculEtu}</td>
              <td>${e.filiereLib}</td>
              <td>${e.encadrantNom}</td>
              <td>
                <c:choose>
                  <c:when test="${e.statutSoutenance == 'EVALUEE'}"><span class="bg-[#E6EEF5] text-[#4A6E8A] rounded-md px-2.5 py-1 text-xs">● Évaluée</span></c:when>
                  <c:when test="${not empty e.statutSoutenance}"><span class="bg-[#E7EFDF] text-[#5B7A4A] rounded-md px-2.5 py-1 text-xs">● ${e.statutSoutenance}</span></c:when>
                  <c:otherwise><span class="text-xs text-[#9A9886]">—</span></c:otherwise>
                </c:choose>
              </td>
              <td class="text-right">
                <a href="${pageContext.request.contextPath}/administrateur?page=etudiants&modifier=${e.matriculEtu}" class="text-xs text-[#5B7A4A] hover:underline mr-3">Modifier</a>
                <form action="${pageContext.request.contextPath}/administrateur?page=etudiants" method="post" class="inline">
                  <input type="hidden" name="action" value="deleteEtudiant">
                  <input type="hidden" name="matricule" value="${e.matriculEtu}">
                  <button type="submit" class="text-xs text-[#B05B74] hover:underline" onclick="return confirm('Supprimer cet étudiant ?');">Supprimer</button>
                </form>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

<!-- Modal : Ajouter un étudiant -->
<div id="modalEtudiant" class="fixed inset-0 bg-[#1D2E22]/40 flex items-center justify-center p-6 z-50 hidden">
  <div class="bg-white rounded-2xl shadow-xl max-w-lg w-full p-8">
    <div class="flex items-start justify-between mb-6">
      <span class="w-11 h-11 rounded-lg bg-[#E7EFDF] flex items-center justify-center"><svg class="w-5 h-5 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg></span>
      <button type="button" onclick="closeModal('modalEtudiant')" class="text-[#9A9886] hover:text-[#2F3A2F] text-xl leading-none">×</button>
    </div>
    <h2 class="text-2xl font-medium text-[#2F3A2F] mb-1">Ajouter un étudiant</h2>
    <p class="text-sm text-[#6E6D5F] mb-6">Complétez les informations pour enrichir votre répertoire.</p>
    <form action="${pageContext.request.contextPath}/administrateur?page=etudiants" method="post" class="flex flex-col gap-4">
      <input type="hidden" name="action" value="${editEtudiant != null ? 'updateEtudiant' : 'ajouter'}">
      <div class="grid grid-cols-2 gap-4">
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Nom</label><input name="nom" required value="${editEtudiant != null ? editEtudiant.nomuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Prénom</label><input name="prenom" required value="${editEtudiant != null ? editEtudiant.prenomuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      </div>
      <div class="grid grid-cols-2 gap-4">
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Matricule</label><input name="matricule" required placeholder="ETU006" value="${editEtudiant != null ? editEtudiant.matriculEtu : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Filière</label><select name="id_filiere" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm">
          <c:forEach var="f" items="${filieres}"><option value="${f[0]}" ${editEtudiant != null && editEtudiant.filiere == f[0] ? 'selected' : ''}>${f[1]}</option></c:forEach>
        </select></div>
      </div>
      <div class="grid grid-cols-2 gap-4">
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Niveau</label><select name="id_niveau" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm">
          <c:forEach var="n" items="${niveaux}"><option value="${n[0]}" ${editEtudiant != null && editEtudiant.niveau == n[0] ? 'selected' : ''}>${n[1]}</option></c:forEach>
        </select></div>
        <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Contact</label><input name="contact" value="${editEtudiant != null ? editEtudiant.contactuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      </div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Email</label><input type="email" name="email" placeholder="etudiant@universite.fr" value="${editEtudiant != null ? editEtudiant.emailuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Adresse</label><input name="adresse" value="${editEtudiant != null ? editEtudiant.adresseuser : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Sujet du mémoire</label><input name="sujet" placeholder="Titre du projet de fin d'études" value="${editEtudiant != null ? editEtudiant.sujet : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Encadreur</label><select name="encadrant" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm">
        <option value="">—</option>
        <c:forEach var="en" items="${enseignants}"><option value="${en.matriculEns}" ${editEtudiant != null && editEtudiant.matriculeenca == en.matriculEns ? 'selected' : ''}>${en.nomuser} ${en.prenomuser}</option></c:forEach>
      </select></div>
      <div class="flex justify-end gap-3 mt-4 pt-5 border-t border-[#F1F2EC]">
        <button type="button" onclick="closeModal('modalEtudiant')" class="border border-[#E3E1D6] rounded-lg px-5 py-2.5 text-sm">Annuler</button>
        <button type="submit" class="bg-[#2F5B45] text-white rounded-lg px-5 py-2.5 text-sm">✓ Enregistrer</button>
      </div>
    </form>
  </div>
</div>

<script>
function openModal(id){var e=document.getElementById(id); if(e){e.classList.remove('hidden'); e.style.display='flex';}}
function closeModal(id){var e=document.getElementById(id); if(e){e.classList.add('hidden'); e.style.display='none';}}
<c:if test="${editEtudiant != null}">openModal('modalEtudiant');</c:if>
</script>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <!-- Top bar -->
    <div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace administrateur <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Tableau de bord</span></p>
      <div class="flex items-center gap-5">
        <span class="text-sm text-[#6E6D5F] border border-[#E3E1D6] rounded-md px-3 py-1.5">2024 — 2025</span>
        <svg class="w-5 h-5 text-[#6E6D5F]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path d="M18 8a6 6 0 1 0-12 0c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.7 21a2 2 0 0 1-3.4 0"/></svg>
        <div class="flex items-center gap-2">
          <span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-sm font-medium">${sessionScope.ConnectedUser.prenomuser.substring(0,1)}${sessionScope.ConnectedUser.nomuser.substring(0,1)}</span>
          <div>
            <p class="text-sm font-medium text-[#2F3A2F]">${sessionScope.ConnectedUser.nomuser}</p>
            <p class="text-xs text-[#9A9886]">Administrateur</p>
          </div>
        </div>
      </div>
    </div>

    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Votre espace, en un coup d'œil</p>
      <div class="flex items-end justify-between mb-8">
        <div>
          <h1 class="text-3xl font-medium text-[#2F3A2F]">Tableau de bord</h1>
          <p class="text-sm text-[#6E6D5F] mt-1">Pilotez vos soutenances, accompagnez la réussite.</p>
        </div>
        <div class="flex gap-3">
          <button class="border border-[#E3E1D6] bg-white rounded-lg px-4 py-2.5 text-sm flex items-center gap-2 hover:border-[#5B7A4A]">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4M7 10l5 5 5-5M12 15V3"/></svg>
            Exporter</button>
          <button type="button" onclick="openModal('modalPlanifier')" class="bg-[#2F5B45] text-white rounded-lg px-4 py-2.5 text-sm flex items-center gap-2 hover:bg-[#274A39]">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path d="M12 5v14M5 12h14"/></svg>
            Planifier une soutenance</button>
        </div>
      </div>

      <!-- Hero card -->
      <div class="rounded-2xl bg-[#E7EFDF] p-8 mb-8 relative overflow-hidden">
        <p class="text-xs tracking-widest uppercase text-[#5B7A4A] mb-3 flex items-center gap-2"><span class="w-1.5 h-1.5 rounded-full bg-[#5B7A4A]"></span>Lundi 16 juin 2025</p>
        <h2 class="text-3xl font-medium text-[#2F3A2F] max-w-md mb-3">Bonjour ${sessionScope.ConnectedUser.nomuser} ${sessionScope.ConnectedUser.prenomuser}, une belle semaine de soutenances vous attend.</h2>
        <p class="text-sm text-[#5B5A4E] mb-5"><span class="font-medium text-[#2F3A2F]">12 soutenances</span> cette semaine. Tout est prêt pour faire briller vos étudiants.</p>
        <a href="${pageContext.request.contextPath}/administrateur?page=soutenances" class="text-sm text-[#2F5B45] font-medium hover:underline inline-flex items-center gap-1.5">Consulter le planning →</a>
      </div>

      <!-- Stats -->
      <div class="grid md:grid-cols-4 gap-5 mb-8">
        <div class="bg-white rounded-xl border border-[#ECEEE6] p-5">
          <div class="flex justify-between items-start mb-4"><p class="text-sm text-[#6E6D5F]">Étudiants inscrits</p><span class="w-9 h-9 rounded-lg bg-[#E7EFDF] flex items-center justify-center"><svg class="w-4 h-4 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg></span></div>
          <p class="text-4xl font-medium text-[#2F3A2F] mb-2">${nbEtudiants}</p>
          <p class="text-xs text-[#9A9886]"><span class="bg-[#E7EFDF] text-[#5B7A4A] rounded px-1.5 py-0.5">↗ +12</span> cette année</p>
        </div>
        <div class="bg-white rounded-xl border border-[#ECEEE6] p-5">
          <div class="flex justify-between items-start mb-4"><p class="text-sm text-[#6E6D5F]">Encadreurs actifs</p><span class="w-9 h-9 rounded-lg bg-[#E6EEF5] flex items-center justify-center"><svg class="w-4 h-4 text-[#4A6E8A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="8" cy="8" r="3"/><circle cx="17" cy="9" r="2.5"/><path d="M2 20c0-3 2.5-5 6-5s6 2 6 5M14 15.5c2.8.3 4.5 2 4.5 4.5"/></svg></span></div>
          <p class="text-4xl font-medium text-[#2F3A2F] mb-2">${nbEnseignants}</p>
          <p class="text-xs text-[#9A9886]"><span class="bg-[#E6EEF5] text-[#4A6E8A] rounded px-1.5 py-0.5">4 filières</span> représentées</p>
        </div>
        <div class="bg-white rounded-xl border border-[#ECEEE6] p-5">
          <div class="flex justify-between items-start mb-4"><p class="text-sm text-[#6E6D5F]">Soutenances planifiées</p><span class="w-9 h-9 rounded-lg bg-[#F5E9DE] flex items-center justify-center"><svg class="w-4 h-4 text-[#B07A45]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><rect x="3" y="4" width="18" height="17" rx="2"/><path d="M3 9h18M8 2v4M16 2v4"/></svg></span></div>
          <p class="text-4xl font-medium text-[#2F3A2F] mb-2">${nbSoutenances}</p>
          <p class="text-xs text-[#9A9886]"><span class="bg-[#F5E9DE] text-[#B07A45] rounded px-1.5 py-0.5">12</span> cette semaine</p>
        </div>
        <div class="bg-white rounded-xl border border-[#ECEEE6] p-5">
          <div class="flex justify-between items-start mb-4"><p class="text-sm text-[#6E6D5F]">Soutenances évaluées</p><span class="w-9 h-9 rounded-lg bg-[#EFE7F5] flex items-center justify-center"><svg class="w-4 h-4 text-[#7A4F8A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="9" r="5"/><path d="M8 13.5 6.5 21 12 18l5.5 3-1.5-7.5"/></svg></span></div>
          <p class="text-4xl font-medium text-[#2F3A2F] mb-2">${nbEvaluees}</p>
          <p class="text-xs text-[#9A9886]"><span class="bg-[#EFE7F5] text-[#7A4F8A] rounded px-1.5 py-0.5">16,4 / 20</span> moyenne générale</p>
        </div>
      </div>

      <!-- Prochaines soutenances -->
      <div class="bg-white rounded-xl border border-[#ECEEE6] p-6 mb-8">
        <div class="flex items-center justify-between mb-1">
          <h3 class="text-lg font-medium text-[#2F3A2F]">Prochaines soutenances <span class="text-xs bg-[#F1F0E8] text-[#6E6D5F] rounded px-1.5 py-0.5 align-middle">5</span></h3>
          <a href="${pageContext.request.contextPath}/administrateur?page=soutenances" class="text-sm text-[#6E6D5F] hover:text-[#2F5B45]">Tout voir →</a>
        </div>
        <p class="text-sm text-[#9A9886] mb-5">Les prochains rendez-vous à ne pas manquer.</p>
        <div class="flex items-center gap-3 mb-5">
          <div class="flex-1 flex items-center gap-2 border border-[#E3E1D6] rounded-lg px-3 py-2.5">
            <svg class="w-4 h-4 text-[#9A9886]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="11" cy="11" r="7"/><path d="m21 21-4.3-4.3"/></svg>
            <input placeholder="Rechercher un étudiant..." class="flex-1 text-sm outline-none bg-transparent">
          </div>
          <select class="border border-[#E3E1D6] rounded-lg px-3 py-2.5 text-sm text-[#6E6D5F]"><option>Toutes les filières</option></select>
        </div>
        <table class="w-full text-sm">
          <thead>
            <tr class="text-left text-xs tracking-widest uppercase text-[#9A9886] border-b border-[#ECEEE6]">
              <th class="pb-3 font-medium">Étudiant</th><th class="pb-3 font-medium">Date &amp; heure</th><th class="pb-3 font-medium">Salle</th><th class="pb-3 font-medium">Statut</th><th></th>
            </tr>
          </thead>
          <tbody class="text-[#2F3A2F]">
            <c:forEach var="s" items="${soutenances}" begin="0" end="4">
            <tr class="border-b border-[#F1F2EC]"><td class="py-4 flex items-center gap-3"><span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-xs font-medium">${s.prenometu.substring(0,1)}${s.nometu.substring(0,1)}</span><div><p class="font-medium">${s.nometu} ${s.prenometu}</p><p class="text-xs text-[#9A9886]">${s.filierelib}</p></div></td><td>${s.jourSoutenance} à ${s.heureSoutenance}<br><span class="text-xs text-[#9A9886]">Salle : ${s.sallesoutenance}</span></td><td>${s.sallesoutenance}</td><td><span class="bg-[#E7EFDF] text-[#5B7A4A] rounded-md px-2.5 py-1 text-xs">● ${s.statutsoutenance}</span></td><td><a href="${pageContext.request.contextPath}/administrateur?page=soutenances&detail=${s.idsoutenance}" title="Voir le détail">→</a></td></tr>
            </c:forEach>
          </tbody>
        </table>
        <div class="flex items-center justify-between text-xs text-[#9A9886] mt-4 pt-4 border-t border-[#F1F2EC]">
          <p>5 soutenances à venir <span class="mx-1">·</span> Session de juin 2025</p>
          <p class="flex items-center gap-1.5"><span class="w-1.5 h-1.5 rounded-full bg-[#9FB89C]"></span>Mis à jour à l'instant</p>
        </div>
      </div>

    </div>

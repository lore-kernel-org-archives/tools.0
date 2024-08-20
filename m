Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4C18DF80
	for <tools@linux.kernel.org>; Tue, 20 Aug 2024 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724152261; cv=none; b=rvdkrtxTm/OUPMRrR9D8l2/hj2ntds5wCwATAgNrpu2f0OYlTVuYsbw5l6h3vJ++lD/rfDYj0Zgsxjxgw7TpakQFl58aYIxuYblExEj6rp5IrayBDG6xwQraEFpuVOlyRPLnYlI3L+g+bEdgufevkbkFTYViiMRvAtS9L8UfjlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724152261; c=relaxed/simple;
	bh=yNltxphzsh8cz6DpPFasoDV0/HSS2yXwTquTqILMxoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RdmXKaeURjMuN4zkTbxu20xTV2/ZJgJkFN0ygyyFDUZnr4H1Oed+aDns6Jdh4NyMu2wzmNZHOg8v8cLIS/1i4RwTMAcow7imzoTz9sPYjUQ5bYBwOIpqcCUnIPKfZSrGTI4FF6pfXg5lop2KuqLgkp+UKw+an+bbj6WBHiRYEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKCeTnft; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKCeTnft"
Received: by smtp.kernel.org (Postfix)
	id 8C9C7C4AF0B; Tue, 20 Aug 2024 11:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C69C4AF09;
	Tue, 20 Aug 2024 11:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724152260;
	bh=yNltxphzsh8cz6DpPFasoDV0/HSS2yXwTquTqILMxoE=;
	h=From:Date:Subject:To:Cc:From;
	b=hKCeTnftX/b0ISGnPnytarK3DKZEX1sP6nhGtJqI0h7FFA5iksX2eTRlkpO4UeAhm
	 vNPuISyFVKLuPGic/pIpP4GcxL60O9wyfRJVRNwiIzy8bc3CIML4oEhviMfrziQGy9
	 +sRNdEcOpFmFwp8BUlUeuu73cI6d5GBtHVmwJ49fcEJtC7iqJr6IuqaS56t4FD5nqX
	 GOW2k/medf37KpayNhZA5U9E0z+oM9QQ3kjoJ0LgCRYeXeoDvBO6AjsQlGdaX4DBnp
	 Cy6epXa2G7ia+106JiytFb/4RmxqWsNMs5TVYx3df8g4DwDVP9qfExq8SY46MPs1Fx
	 bJCH+JV9eSMXw==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Tue, 20 Aug 2024 13:10:50 +0200
Subject: [PATCH b4] send: generate patches with --no-mailmap
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240820-send-mailmap-v1-1-7f35789be4b1@kernel.org>
X-B4-Tracking: v=1; b=H4sIALl5xGYC/x3MQQqAIBBA0avIrBPMDKyrRAvNsQbSRCEC6e5Jy
 7f4v0LBTFhgZhUy3lToig19x2A7TNyRk2sGKaQSWgpeMDoeDJ3BJI5eWzNMWo3CQ0tSRk/Pv1v
 AKljf9wMP5a+9YgAAAA==
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=yNltxphzsh8cz6DpPFasoDV0/HSS2yXwTquTqILMxoE=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBmxHnD/RnjuSR+4QeFaVYxhPuP14+3QkzbylGPl
 59B8aNLkU2JAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZsR5wwAKCRD2t4JPQmmg
 c9Q+D/40eGCrR/HnXJ8zOyguBKAsiqHA1icdxev2/fZlCvVjPYIWft8mozbJ7o1XF31KNB2q1tw
 lh863d54NOs+Z3/ddQQxivKTc2qXa+kJ9Sm2MGYA/bt89KJY24F+dKRJwNWdUqui6/Lo68vEsue
 VyCeoTAncU99gc+GaUSlnjs6xdChU2lmxKICkQLYGxNP9ceJGo7AvXcdtdTskZpD/st7HjYk2xG
 rcFTe9wkTfyPOfUOABYDBKqVzIT0TupJBgei1ZJRoz1TWl15k/PdZvdcFua6etY0xzrdG7EjCSq
 1bVvlbc50ZoX5HeZj+8AjNjmj6evcmH7o7xdDN4/6bJTw9TIucRHkKIRhRTTW2j26vkS1u5vau+
 MdFwElceP6m4WegaSfrn2qz9mbIVVoHFIv7dghU+POuAPEHrj3ohhjaFedeNr0jsGCkBAFWU8Wr
 1QHT2qTEuPjE5yB2so0mMRItSGCaXbQKbmbcu4gXydg2My6wiIwl4YV6O2Mv853b2PSxJrkTrwQ
 ouUxvveGR2r/WPWB8I3DBBnmCnuiuOU/ZmtP8N5Kc4hKL400LMtshhNJEH/LLrcbIMGj1tKz8Dt
 ldb/CE3t7wKXHCq3hvCV9tqibO0CBNc60PVuF6HEFkilOhNF9Y0Q1dg3L0BE38dm+Bdz0pUbERA
 uei8D/7LyBWnu3g==
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

b4 uses 'git show' to generate patches. By default, this command will
use the mailmap file to convert author and committer names and email
addresses if there is a match.

That's good to display the last identity when looking at old commits in
the history, but it doesn't sound like a good idea when sending patches.
'git format-patch' doesn't use the mailmap file, it currently doesn't
even support it, and it is not planned to support it apparently [1].
Note that 'git send-email' might support a new '--mailmap' option, but
it looks like this option will not be enabled by default [2].

In my case, I had to send some patches, including one from someone else
who has to use the email address from his company, but has an entry in
the mailmap file to his @kernel.org email address. When I sent his
patch, b4 seamlessly converted his email address, and caused checkpatch
to complain, because the From and the SoB entries were different.

Here, we ensure the conversion is not done, to avoid any surprise once
the emails are sent.

Link: https://lore.kernel.org/all/20240813-jk-support-mailmap-git-format-patch-v1-1-1aea690ea5dd@gmail.com/ [1]
Link: https://lore.kernel.org/all/20240819-jk-send-email-mailmap-support-v2-0-d212c3f9e505@gmail.com/ [2]
Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2b1a058..283a5d5 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3411,7 +3411,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             logger.debug('Ignoring commit %s', commit)
             continue
         ecode, out = git_run_command(gitdir, ['show', '--format=email', '--patch-with-stat', '--encoding=utf-8',
-                                              commit], decode=False)
+                                              '--no-mailmap', commit], decode=False)
         if ecode > 0:
             raise RuntimeError(f'Could not get a patch out of {commit}')
         msg = email.message_from_bytes(out, policy=emlpolicy)

---
base-commit: 37811c93f50e70f325e45107a9a20ffc69f2f6dc
change-id: 20240820-send-mailmap-ef8ba398450f

Best regards,
-- 
Matthieu Baerts (NGI0) <matttbe@kernel.org>


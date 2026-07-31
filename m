Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7A030C158
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489695; cv=none; b=ZTBSjJL7i2abEsdD0HwYa1Dh3Dj/rg8s07ZfaeESIJW6PfpPlkfdze3Oe4Cfl2iYX1kkTkT769QurV3UW9340pWLJsJlVaKAuwV8QwSZ/2DMgKx/w8mqz4vrz6Rccbyq7eDyg5bqET2e6mJKQIV05VKk5Ff7BnhUB8ldMTLnvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489695; c=relaxed/simple;
	bh=su0IRGgrOg5ig4uNW/lcynLjguacCinuqIs4pDshBkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fj+S69kT3x1cQwP9W/lRe+5B6QxAhQswJVMUn1kQYyRi2huGnr/QQ9cIaMIp2Tz8PM90miAY3+mUYV36phdskctWyIZLsGBAlVZEdDvOyvHWZwszuL5on0mGs1Qjsh4fL9+0tpI+gi03rHRANE+8hrRHdMEiqLhw7HOOswciu48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7MRQUyp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7MRQUyp"
Received: by smtp.kernel.org (Postfix)
	id BE89B1F00A3A; Fri, 31 Jul 2026 09:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10921F000E9;
	Fri, 31 Jul 2026 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489693;
	bh=Gwx70h7uwzskpEYh/7L8f0LAVUeBcVtmTYKpdBKsXNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=X7MRQUypySDYPO8wuQnBSuo9VpDsuRRAfJ2Pp/vwKNkd2EtqH+7zJLSnsR0v4Vefr
	 5IBO91uL3Or1aggfodOXnuoOTcThcisnOPpEwXnR++d2dJtbjAnkDgG0uk4UaZoPz/
	 kIssCTbqbPmXJIVoMFvnHsOZFJ1hJ9OiCY/1V39ZWPPYig7LaDz+ORGlZ4sIduhcVB
	 jGD3KAY+xhBt6Al6ALlWN4wihcYNP+vJyHNuv28uNVwtuOxO8JyIgXOCN7DuVaWGH4
	 97PaMT6evjbF/MbuMCc8mqSLaRAjemJWEMOzGu8ySMi1+P0u7/Tp5zDT0kyPyqlMbA
	 72Yt9frggTrpg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:04 +0200
Subject: [PATCH b4 05/27] review: drop the unused return value from
 set_flags_bulk()
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-5-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=4626; i=brauner@kernel.org;
 h=from:subject:message-id; bh=su0IRGgrOg5ig4uNW/lcynLjguacCinuqIs4pDshBkI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIrekUq7PT/33+5JEaKHz7/cf3Km5rTzhW3KE7jPf
 ufzyONo7ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIVwbDXxGxJ5VPWJQdFdvE
 sowkiw2F/QNer95yV+LO8lvnkxMv/Gf4p2Q1e+KUCQuUDLmmvIw5P1dVOEe1KmnG5+cmCo2vMnj
 X8gIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

set_flags_bulk() returns the number of messages that didn't already
carry the flag. Nothing uses it. The unread badge accounting it was
added for ended up taking its count from get_flags_bulk() instead, over
the messages that are new to the thread, which is a different number.

An unused return value still reads like a contract callers may rely on
and the next person has to work out that none do. Take it back out. Keep
the early continue it brought with it. A row the INSERT just created
already carries exactly this flag, so there is nothing for the
read-modify-write below to do.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/messages.py  |  8 ++------
 src/tests/test_messages.py | 44 --------------------------------------------
 2 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/src/b4/review/messages.py b/src/b4/review/messages.py
index a73e986..b388d93 100644
--- a/src/b4/review/messages.py
+++ b/src/b4/review/messages.py
@@ -102,13 +102,11 @@ def set_flag(
 
 def set_flags_bulk(
     conn: sqlite3.Connection, entries: List[Dict[str, Optional[str]]], flag: str
-) -> int:
+) -> None:
     """Add *flag* to multiple messages in one transaction.
 
     Each entry in *entries* is ``{'msgid': ..., 'msg_date': ...}``.
-    Returns the number of messages that did not have *flag* before.
     """
-    newly_flagged = 0
     for entry in entries:
         msgid = entry.get('msgid', '')
         msg_date = entry.get('msg_date')
@@ -121,7 +119,7 @@ def set_flags_bulk(
             (msgid, msg_date, flag),
         )
         if cursor.rowcount > 0:
-            newly_flagged += 1
+            # Row created carrying exactly this flag; nothing to merge
             continue
         row = conn.execute(
             'SELECT flags FROM messages WHERE msgid = ?', (msgid,)
@@ -130,13 +128,11 @@ def set_flags_bulk(
             existing = set(row[0].split())
             if flag not in existing:
                 existing.add(flag)
-                newly_flagged += 1
                 conn.execute(
                     'UPDATE messages SET flags = ? WHERE msgid = ?',
                     (' '.join(sorted(existing)), msgid),
                 )
     conn.commit()
-    return newly_flagged
 
 
 def remove_flag(conn: sqlite3.Connection, msgid: str, flag: str) -> None:
diff --git a/src/tests/test_messages.py b/src/tests/test_messages.py
index 904776d..14e1743 100644
--- a/src/tests/test_messages.py
+++ b/src/tests/test_messages.py
@@ -222,50 +222,6 @@ class TestCleanupOld:
         conn.close()
 
 
-class TestSetFlagsBulkReturnValue:
-    """Tests for the newly-flagged count returned by set_flags_bulk()."""
-
-    def test_counts_new_rows(self, tmp_path: pytest.TempPathFactory) -> None:
-        conn = messages.get_db()
-        entries: List[Dict[str, Optional[str]]] = [
-            {'msgid': 'n1@example.com', 'msg_date': None},
-            {'msgid': 'n2@example.com', 'msg_date': None},
-        ]
-        assert messages.set_flags_bulk(conn, entries, 'Seen') == 2
-        conn.close()
-
-    def test_repeat_is_zero(self, tmp_path: pytest.TempPathFactory) -> None:
-        conn = messages.get_db()
-        entries: List[Dict[str, Optional[str]]] = [
-            {'msgid': 'r1@example.com', 'msg_date': None},
-        ]
-        messages.set_flags_bulk(conn, entries, 'Seen')
-        assert messages.set_flags_bulk(conn, entries, 'Seen') == 0
-        conn.close()
-
-    def test_mixed_new_and_existing(self, tmp_path: pytest.TempPathFactory) -> None:
-        conn = messages.get_db()
-        first: List[Dict[str, Optional[str]]] = [
-            {'msgid': 'm1@example.com', 'msg_date': None},
-        ]
-        messages.set_flags_bulk(conn, first, 'Seen')
-        both: List[Dict[str, Optional[str]]] = [
-            {'msgid': 'm1@example.com', 'msg_date': None},
-            {'msgid': 'm2@example.com', 'msg_date': None},
-        ]
-        assert messages.set_flags_bulk(conn, both, 'Seen') == 1
-        conn.close()
-
-    def test_new_flag_on_existing_row(self, tmp_path: pytest.TempPathFactory) -> None:
-        conn = messages.get_db()
-        entries: List[Dict[str, Optional[str]]] = [
-            {'msgid': 'f1@example.com', 'msg_date': None},
-        ]
-        messages.set_flags_bulk(conn, entries, 'Seen')
-        assert messages.set_flags_bulk(conn, entries, 'Answered') == 1
-        conn.close()
-
-
 class TestMarkOutgoingSeen:
     """Tests for mark_outgoing_seen()."""
 

-- 
2.53.0


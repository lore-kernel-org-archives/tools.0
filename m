Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668CC351C04
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535141; cv=none; b=jLWfBFYVsyTNONTjWeTKjjwe5UgLgqUdG7tkmoYjVi02gylzCvtVIwInFYgguI8aflkfls77i1Ey5rSf3necLRjEqgKWwKxxXNZJXbywPMWd7HLOjTGumGX8ZnKTpKnkhleynwLCZP5j5RKND+ZdqvNSQreTsYOOK5LdUyrh4p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535141; c=relaxed/simple;
	bh=SSvjR9fZoSqC4CJ/2rUrxgu2oW6bAKNetrZETHNLTiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFkFhOS9CWMSY4+1IALtXF8z6VZo5++cos/KpoIf7UlQRCSS7hO4grZjlr9RJKWohnSh3yay3yiEIPP+dYxWzoZD4o/LhSfik8CQ8xBLsn2rZfSdds9E9kFkfdY9d7dmnKQ+hmsb90ONQkzo1YJ08xgZtz12Wz/KV5IrqohCoQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euWxw4RY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euWxw4RY"
Received: by smtp.kernel.org (Postfix)
	id 654991F00ACA; Fri, 31 Jul 2026 21:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EFE1F00AC4;
	Fri, 31 Jul 2026 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535140;
	bh=UskKR2gJBTRJufNfcLLmy1vrQAnvZ6lsH44vH8o60LI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=euWxw4RYnMeezFypb3zP9S4iIdzqYhZUVLkuMBAx2Zssow52JyivdmDBmEsmi7LTf
	 lQflX5vhoLa79ptgBn7sI4r4FG9lfHkPny01h7SYH3xQgaIWrA/nxijfd4J58oUhzR
	 I0cl2eskvEodiGoa2fRCaLihQrFHWkY+P7aA0NX3jGUktn9HF1ckeOx+D1ZBYCAgNH
	 y8+DxJBv0Duf008reU25vYkcI2DFxjlJ0DyGqwAJPHXwhqdNhywlYXWAxYHxm43j3g
	 pKxU1VdJs4sTbLMQppcXgWNVv1LDdFl2ngPBR/K08rZN5V24orWQ5VKeURO5mTGwH8
	 fTCOiKLojI3gQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:46 +0200
Subject: [PATCH b4 v2 05/44] review: drop the unused return value from
 set_flags_bulk()
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-5-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=4228; i=brauner@kernel.org;
 h=from:subject:message-id; bh=SSvjR9fZoSqC4CJ/2rUrxgu2oW6bAKNetrZETHNLTiI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3axVS9jXe6qetXrXsrLoYu0c3I/Che8Fkoe2GXZ
 IGU9v09HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABN54cLI8FB/cs+26JZMxv3P
 u+fd6OR4yHyXR1ueS+nwxrKPNmFxhowMj3dViBkE/ti37tz+qTdmfX127oCCIvNa36bv68ICt8+
 P4AMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

set_flags_bulk() returns the number of newly flagged messages, but
nothing uses it. Remove it. Keep the early continue it brought with
it: a row the INSERT just created already carries the flag.

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


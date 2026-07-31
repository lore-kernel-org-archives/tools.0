Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EAA36197F
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535140; cv=none; b=bsROaM72wl0bpHHmNkdzC+4LSRh0K6Vu5j3OuCQvnoR7CPL0tUzaKex7BwL8Jc8fcUMHG5OoOW5ELSzY4f5qQtBzInY5zLlaFtD1GoGe2vss573ZHYLoRGumqLzb5JQAaQnC+6zO8SeyOIaWnCDE5qri0gXSkw8Pyw4d9LcmWrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535140; c=relaxed/simple;
	bh=XaJzqnLR64LeBUC9x3KCHkCRmna+zixjbvALxK00mG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEUL7X/N1tsYhnpC2ymvG4Ny11B2ZKvrkINssjDXE2wV5K8blp4J7oOj9CXmrIadhzhQB6oJlr7XEqGSUnySFnh6XL+y8H+WCy9aeq8nhBnxKPbyE7dfIvQbEhCuxkwX5XFwquxF3nBO8r3oYIOKevA+Miz8gSBKy7rDhM5Xlec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQfrNEtV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQfrNEtV"
Received: by smtp.kernel.org (Postfix)
	id 3696F1F00ACF; Fri, 31 Jul 2026 21:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681D81F00AC4;
	Fri, 31 Jul 2026 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535139;
	bh=ByuEmgx6nKaEmL1C1vzu/7rLCPw92jc5wk3wgAGgAzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GQfrNEtV65YZRx33i6sNu5wzoBnk14al1K7OH5BaypOn3vbFyy7zZWBgWhqrIM/9X
	 NRUGm9VdAe2rlJ78AEQhimETbmeXk90c5+bm9jQfGJBZv5TieaAAGYnVAdjewqq2N5
	 H7/EWpXjllNa4A8GILbYMnpL87d8iCgXVsTMD5hEuw2ia8jWggj/eiipUU9FZl14Mv
	 bbjddrH/UJzgA+iAwirfds3oWWCy+JkU0yUcAeBsz5wMTUT59Muw89CInAIfSX8jZM
	 uE/7QS4PqjeIysAatpPKdDQTS37fHhD8q4F1qjA8QqWbA6JHquuec09vChx9gYFx0c
	 3jG7Iax04rEJw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:45 +0200
Subject: [PATCH b4 v2 04/44] review: use the same busy timeout for both
 review databases
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-4-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=brauner@kernel.org;
 h=from:subject:message-id; bh=XaJzqnLR64LeBUC9x3KCHkCRmna+zixjbvALxK00mG0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1yaTN0+bTt8xl2rTfRW5rq2Hj6OZOsO18kXRaoW
 /Do87TujhIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgImEazJ8r7q9+HWU69SSg5U/
 68/9XGf17YtsU1PvIZn2b1Lf6qc1MDLsFjxy4VryjoCWWRP75syMexKlumjzBJPFj/raX7vufVf
 KBAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The messages database uses a 5s busy timeout, the tracking database
next to it 15s, with the same two writers. There is no reason for them
to differ. Use the same value for both.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/messages.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/b4/review/messages.py b/src/b4/review/messages.py
index a3a2d53..a73e986 100644
--- a/src/b4/review/messages.py
+++ b/src/b4/review/messages.py
@@ -44,8 +44,9 @@ def get_db() -> sqlite3.Connection:
     is_new = not os.path.exists(db_path)
     conn = sqlite3.connect(db_path)
     conn.row_factory = sqlite3.Row
-    # Both the TUI and 'b4 review cron' may write concurrently
-    conn.execute('PRAGMA busy_timeout = 5000')
+    # Both the TUI and 'b4 review cron' may write concurrently; same
+    # generous timeout the tracking database uses, for the same reason
+    conn.execute('PRAGMA busy_timeout = 15000')
     if is_new:
         conn.executescript(SCHEMA_SQL)
         conn.execute(

-- 
2.53.0


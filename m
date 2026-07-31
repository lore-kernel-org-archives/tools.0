Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B630C158
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489693; cv=none; b=PDx6a3Z0EdCSjgBNkRNlBa+c/XpxMhtxnrNHl2heie79wgoMRiKI6tB1gHl1h2bUq3nki9VzQssCzWp74m5dLRONrHLg2vuvzBWRIDSNI3NVP7ZKwOMklMz+loXpn3TGb6g1xHkGiMKzFwSYeEFf5as7TWi8fLg2NPki5dKSREY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489693; c=relaxed/simple;
	bh=x/WFamEqQD4RkyLfS84OHni/OF8R7fH61tfinoOGXbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcVlMtOZzoxW8r87o37A0kSAcAGdC7Wsoxf2zHhrNckWYVUrMEwXK7m3+3xLtjut6iIYsBeCyp8SrrAm0/jUHLu97W2Rook0rbETF1HD66WGYI47vj/ZivciJP5qfUhzOsleo+d7TMnVqpTmBK6OY93I8hlRBmGjrXK+lf+xajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1Wm6+IJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1Wm6+IJ"
Received: by smtp.kernel.org (Postfix)
	id 96C3B1F00A3A; Fri, 31 Jul 2026 09:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D271F000E9;
	Fri, 31 Jul 2026 09:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489692;
	bh=eIo9r9jT7QBPTnlk/OUfJ+muWX0oT8z3OgQ7CyZtBrs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=o1Wm6+IJJESPTikh3F+/3DzDKOlNYciEYEhAAGgtjsFlZIRqGUL+5ttBHcUT367jF
	 moXb0lV3tiLLrTyXnUjRjCw0boZQziIPncpQe3PI+TeJWGtWeqMHRW44NK9e0mXJFC
	 0DWn73GpOrg3dihUUGZSDXgxljAxmxepTw/gav4Oee3LVFNWG1t6pxtt8yO1LvYHq3
	 3NexlmRZufJmLo6UO58OdjujGuL8Nu2hp2RTX/W3IeuSm025K4mWvz6mr6q5K1WY9R
	 rEeZH1kH+qyfZOCpLuOhoA/s13TLkaPjJo12OwkpBWpbrcpoaZHfiwfvW7w7aY2pwV
	 KL0WhR+ADMydA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:03 +0200
Subject: [PATCH b4 04/27] review: use the same busy timeout for both review
 databases
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-4-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=brauner@kernel.org;
 h=from:subject:message-id; bh=x/WFamEqQD4RkyLfS84OHni/OF8R7fH61tfinoOGXbE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIoGPdqUuVTxY5aPqB1XTvmzk1O0r877+qma77rLx
 n12z2Y/6ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjIXTeG/yWcLdtsUrwXHPlj
 9e3Kip4b6/ZtjZuxL59N4POK6V4umVIM/ww/HF0055zZdqfPLBcazu34oxUx7eT7tddKBe7ManB
 fbcwLAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The messages database got a busy_timeout of 5s when it grew concurrent
writers. The tracking database sitting next to it uses 15s and has the
same two writers, the TUI and a "b4 review cron" sweep, doing the same
short write transactions.

There is no reason for the two to differ. All it means is that the flags
database is the first to give up with "database is locked" when a cron
sweep and an interactive session overlap. Use the same value.

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


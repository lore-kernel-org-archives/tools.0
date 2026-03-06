Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16E38E5E7
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806391; cv=none; b=Q65mUbzt8j2kG7E83oV5MR+cvqgMEN4TEe7n6kyW9eTMxMkuJhG9jwBJnf9NjiW+shPf+n0xEGYbG4p5C1UQaq4qOjFbyGYwDSd5N/HzcFDyXMQTN2AaJrMmfqBLxiNfrrnB0fJgEqNDESDFp3qjv0XKd0nY4oZ00HGAL0lSa3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806391; c=relaxed/simple;
	bh=+VEdp9t/O+eOIRgLY8fKI8DQrkBRk+wtMfF0S0Z3Pdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uLR+TVvL5SIQAMyAL70GZPFUBmnbiC7nIF0iQkGXPJJS2MaD0gF3OFiJzupuoIXxy59zrMujmDp7G+x4m6OKP/OJWMso5NiSPg1rqdNglauAUBAj/38z3HbJV6nK2Ben0mM6HGM7BaUYru4dKi5Or+u8v1zoVLf2BhMSkHDw9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJFvLt+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJFvLt+t"
Received: by smtp.kernel.org (Postfix)
	id 4E252C2BC87; Fri,  6 Mar 2026 14:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07350C2BC86;
	Fri,  6 Mar 2026 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806391;
	bh=+VEdp9t/O+eOIRgLY8fKI8DQrkBRk+wtMfF0S0Z3Pdg=;
	h=From:Date:Subject:To:Cc:From;
	b=bJFvLt+tWWuD+AJJRJi9hO7uCce6ZvTTTsE6W57k6374eMCbIev0ABs9Y0aCPkYGS
	 YRLb5zI7qF0YHgIbos5cl7CctTuf8jypVRRXWT+IVdSE4D+SA+6VcL2TLGaSnASX6B
	 Yz+x6ZTkdOBwrhOTTZRQpVZLtCZC9kE3ZB45cO4guIk3JeqBmsvekZbLBInZtOuz2+
	 7U2cZz78vhNDFPUGVRNJ9w9CyFaKuxGLCo2tHOUxIOljccn/kO0g8nFWmEysGlPQHi
	 Jy6LdbNecCmc4WgqEUwS6CExGkPIGsTfXEjVw5zstwrWuAhHeNTGmCzrfKkvTjj+jh
	 TqRKNQ4ACmQGg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 06 Mar 2026 15:13:06 +0100
Subject: [PATCH b4] send: add --in-reply-to option for threading cover
 letters
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPHgqmkC/yWMSw6CQBAFr0J6bZsRyIBexbiYTyNtdCDdo9EQ7
 i6jy6q8VwsoCZPCqVpA6MXKU9rgsKsgjC5dCTluDLWprWmMRd+iUorICYXm+wfzhEfTUU+Njd3
 Qw/achQZ+/6pn8C1c/k6f/kYhl1xZeaeEXlwKY1EPp5lkXyys6xegw6HZmQAAAA==
X-Change-ID: 20260306-b4-send-in-reply-to-907e8e36d7f8
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Christian Brauner <christian@amutable.com>, 
 "Claude Opus 4.6" <noreply@anthropic.com>, 
 Christian Brauner <brauner@kernel.org>
X-Mailer: b4 0.15-dev-35a11
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631; i=brauner@kernel.org;
 h=from:subject:message-id; bh=+VEdp9t/O+eOIRgLY8fKI8DQrkBRk+wtMfF0S0Z3Pdg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSuevCV8Xza0guvdWdfv6xx9lBJ/8t0g4XF2ccmnJr9c
 OKdqIkm2h2lLAxiXAyyYoosDu0m4XLLeSo2G2VqwMxhZQIZwsDFKQA3mZHhf9nstM1WPumqt689
 6L7cf96r5HFii/xSq4dse88eahea1cXwP1MhQytzS/ebxkMXOuUebwuduLX3drnbOtmTF3rO1l6
 /ywsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Add a --in-reply-to flag to b4 send that sets the In-Reply-To and
References headers on the cover letter (or single patch). This allows
sending a new series version as a reply to the previous version or to
an existing discussion thread, which is a common workflow on mailing
lists that b4 did not directly support until now.

The message ID is automatically wrapped in angle brackets if not
already provided with them.

Co-developed-by: Claude Opus 4.6 <noreply@anthropic.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 src/b4/command.py |  2 ++
 src/b4/ez.py      | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/src/b4/command.py b/src/b4/command.py
index a49a8bc..c246d30 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -425,6 +425,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Do not add any addresses found in the cover or patch trailers to To: or Cc:')
     sp_send.add_argument('--to', nargs='+', metavar='ADDR', help='Addresses to add to the To: list')
     sp_send.add_argument('--cc', nargs='+', metavar='ADDR', help='Addresses to add to the Cc: list')
+    sp_send.add_argument('--in-reply-to', dest='in_reply_to', metavar='MSGID',
+                         help='Message ID to use as In-Reply-To for the cover letter (or single patch)')
     sp_send.add_argument('--not-me-too', action='store_true', default=False,
                          help='Remove yourself from the To: or Cc: list')
     sp_send.add_argument('--resend', metavar='vN', nargs='?', const='latest',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 52eb239..3e703ed 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2203,6 +2203,20 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             logger.info('')
             sys.exit(130)
 
+    if cmdargs.in_reply_to:
+        irt = cmdargs.in_reply_to.strip()
+        if not irt.startswith('<'):
+            irt = f'<{irt}>'
+        cover_msg = patches[0][1]
+        if cover_msg['In-Reply-To']:
+            cover_msg.replace_header('In-Reply-To', irt)
+        else:
+            cover_msg.add_header('In-Reply-To', irt)
+        if cover_msg['References']:
+            cover_msg.replace_header('References', irt)
+        else:
+            cover_msg.add_header('References', irt)
+
     # And now we go through each message to set addressees and send them off
     sign = True
     _csnps = str(config.get('send-no-patatt-sign', ''))

---
base-commit: 5b4eaae60fd938a865dda1916885e9a1c7ddce8a
change-id: 20260306-b4-send-in-reply-to-907e8e36d7f8


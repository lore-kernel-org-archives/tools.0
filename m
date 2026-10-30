Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368068;
	b=vvy+WF0tfDlHqdGbNjIjAS1QbTNf8C6qfY+NIj7q6AlGj5i1TE0hcIrHE67Ql0VI2esb
	 WV8o6zCDg5AwPbt8hCly5bmhjs9GLwTUZNxryBTHU1echzu3e7i3s/NIHm9r64oWuuw63
	 PuPVLEMyhvSYXYOaj8nyi/aNjdZOLTQQtM32YCrBQAh7xPl0DKOE+03qmAN3/FvZhtQgR
	 wlM8SfAKYhbjI9187Ae5bSgeYfQEW/w6YnPHCq7Cu/5I3yzpAfN2W9QWxeUP4b97q7/51
	 Zv4ZuxQ9ThI3tnLGN2S8Z6e9riGCSLTyTYlFKypEPlIkof97X+SoBli35GNrm6rfnXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368068;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NtR5jR3EiQfUEaYLcYkOXYr7FrcOJqZ9iBSHcP4AWSQ=;
	b=pK8CLXoU/Q586tPSHG1OrYW3PCLPHMpIwfZmB6HH0svYAw+Lh5E1Bbx/xInl9BSJDr/z
	 FcLsk63Cx2WzmEySt6GtNUWsm5eZwY9e7SJwC8RKfkMnoPQ0nsI5Kv7KLeBAmx4pRt9jE
	 D3CO+5uGYumrnLyXaW6Bqf1V3N56DSJD1FcBvuyH1iQAlfaBWajic+2L0OPDNB21gNOhp
	 dGjhAAeoVeOzLuWgbHoHk/WrIG+nGwTGLe/DHb7HfQt1Ndy2G1iP0oQNWlX0jlKbUaIr0
	 jTn2ftKpDik/44BLJESwmr7QFbWc7s7htlUZ0iCpfTgngJ3f2RQZYvgDSnAJRKznd4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGQlJWmJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C3D606A31C
	for <tools@linux.kernel.org>; Fri, 30 Oct 2026 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGQlJWmJ
Received: by smtp.kernel.org (Postfix)
	id 6CA721F00A02; Fri, 30 Oct 2026 13:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68EB1F0093A;
	Fri, 30 Oct 2026 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368067;
	bh=NtR5jR3EiQfUEaYLcYkOXYr7FrcOJqZ9iBSHcP4AWSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KGQlJWmJUxL/rMl3pjM6yH3v1W8dg/gx9iqg4NhyWuNd8xMqPL9NMkwimqbuwhu1J
	 A7bwjs5B8lEfbETzlqG5fydgILWyRtgQiuoAwgRgkEOH148wRjxpn0KN96dl0uKykk
	 R6JGmy+jfuhN9F+98IvfhUkXU5NuF5vtJuJRrIEyyLcWICru6hlFogVd7rwicMtgaq
	 thBrzAKYH8w8PvQL19q5PqpjvIe1aqwlCvxpH6W+hGqNQdwpRIcLXA6J1cc+HmRd4q
	 hqcbfnMbWZ/dMVLGChBFK73e9ZTaYm6EV4SZ1IQjLyWSVEDiDHIy2kcs+MhVdfoY5C
	 HidSo/MbCR5Yw==
From: Brian Masney <masneyb@kernel.org>
Date: Fri, 30 Oct 2026 09:47:28 -0400
Subject: [PATCH b4 v2 1/3] review: centralize lookup of patchwork key in
 one place
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-pw-key-command-v2-1-95fb0f822834@kernel.org>
References: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
In-Reply-To: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4941; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=z8SzmV0QpkEiCkBymzcjLgLwOfYZbxnvxwqL3JR+N3U=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKezP+/q2zzvqdniyPqt0kc0mj3KW0KXVz+7qTNH825d
 qXC/9fu6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiYXMZ/ikonyrc+uTZc70/
 CnVl7ZLndyW5rLylGvtoW7wHg4b07OuMDOfZD9QaOrmdmb/4ysGJZ+t15L8Z7LY5wDo3wS7lz1X
 R2bwA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce get_pw_key() so that the patchwork key lookup is done in one
place. This is in preparation for adding a pw-key-command configuration
option.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/b4/__init__.py                 | 14 ++++++++++++--
 src/b4/review/_review.py           |  4 ++--
 src/b4/review_tui/_common.py       |  2 +-
 src/b4/review_tui/_entry.py        |  2 +-
 src/b4/review_tui/_tracking_app.py |  2 +-
 5 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index eb04a2af55ee..16b7208f0b09 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2504,7 +2504,7 @@ class LoreMessage:
     @staticmethod
     def get_patchwork_data_by_msgid(msgid: str) -> Dict[str, str]:
         config = get_main_config()
-        pwkey = str(config.get('pw-key', ''))
+        pwkey = get_pw_key(config)
         pwurl = str(config.get('pw-url', ''))
         pwproj = str(config.get('pw-project', ''))
         if not (pwkey and pwurl and pwproj):
@@ -6402,6 +6402,16 @@ def get_smtp(
     return SMTPConnector(_connect), fromaddr
 
 
+def get_pw_key(config: Optional[ConfigDictT] = None) -> str:
+    """Return the Patchwork API key from b4.pw-key.
+
+    Returns an empty string when no key is configured.
+    """
+    if config is None:
+        config = get_main_config()
+    return str(config.get('pw-key', '') or '')
+
+
 def get_patchwork_session(pwkey: str, pwurl: str) -> Tuple[requests.Session, str]:
     session = requests.session()
     session.headers.update(
@@ -6418,7 +6428,7 @@ def get_patchwork_session(pwkey: str, pwurl: str) -> Tuple[requests.Session, str
 def patchwork_set_state(msgids: List[str], state: str) -> None:
     # Do we have a pw-key defined in config?
     config = get_main_config()
-    pwkey = str(config.get('pw-key', ''))
+    pwkey = get_pw_key(config)
     pwurl = str(config.get('pw-url', ''))
     pwproj = str(config.get('pw-project', ''))
     if not (pwkey and pwurl and pwproj):
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f094bc7..c5e4289ea930 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -4232,7 +4232,7 @@ def pw_update_series_state(
     Patchwork is not configured), False on failure.
     """
     config = b4.get_main_config()
-    pwkey = str(config.get('pw-key', ''))
+    pwkey = b4.get_pw_key(config)
     pwurl = str(config.get('pw-url', ''))
     if not (pwkey and pwurl):
         # Patchwork not configured, nothing to do
@@ -4270,7 +4270,7 @@ def pw_lookup_series_id(msgid: str) -> Optional[int]:
     configured or does not know the message.
     """
     config = b4.get_main_config()
-    pwkey = str(config.get('pw-key', ''))
+    pwkey = b4.get_pw_key(config)
     pwurl = str(config.get('pw-url', ''))
     pwproj = str(config.get('pw-project', ''))
     if not (pwkey and pwurl and pwproj):
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 43db8c9358bf..205762956517 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -361,7 +361,7 @@ class CheckRunnerMixin:
 
         # Patchwork config for _builtin_patchwork
         config = b4.get_main_config()
-        pwkey = str(config.get('pw-key', ''))
+        pwkey = b4.get_pw_key(config)
         pwurl = str(config.get('pw-url', ''))
 
         # Dump tracking data to a temp file for external scripts.  This is
diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index 700c5eae0e6a..275d6703949f 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -151,7 +151,7 @@ def run_tracking_tui(
             if branch_name == TrackingApp.PATCHWORK_SENTINEL:
                 # User pressed [p]atchwork — run PwApp and loop back
                 config = b4.get_main_config()
-                pwkey = str(config.get('pw-key', ''))
+                pwkey = b4.get_pw_key(config)
                 pwurl = str(config.get('pw-url', ''))
                 pwproj = str(config.get('pw-project', ''))
                 if pwkey and pwurl and pwproj:
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 4ae826ee5b9e..75d652149e29 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1159,7 +1159,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._db_mtime: float = 0.0
         # Detect patchwork configuration
         config = b4.get_main_config()
-        self._pwkey = str(config.get('pw-key', ''))
+        self._pwkey = b4.get_pw_key(config)
         self._pwurl = str(config.get('pw-url', ''))
         self._pwproj = str(config.get('pw-project', ''))
         # Remember last snooze choices within the session

-- 
2.56.0


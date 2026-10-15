Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD034525A94
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073334; cv=none; b=jEP0nX+5XR1zQDkHYnW4xdYtzzo8rw0Y4H/2FRK7damfYhYx6MpVHeqYOzjBwmSYXHWhc8IpKmErKfTN1LqrwukENSNKOd6lINDVwIMNS7Dt0Xq8sr4hOBNqJxCRCInXnZhWJlyh1uKnwTrk6e68jv3pUGfYD6TS0FlDICDO+u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073334; c=relaxed/simple;
	bh=CEzGH1j2HrHNO4YSf5Sy1dlmIBM0BnJvLvlM/ETRo4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfmL+w0JlNT8xxfRFcPkcvu0k0BrXZFGxurEl5+pIXSiU2P6oUUbCTHOe7/7X3PcYhO4Z+CIp1nuUfuB8E8uNnm50HT2i9SUWIGTKABWyUc9coz1lkdEO0uyFQD0g1yzksWeuAemTeAP4M/AMokLpspn7E2KpOGT2kzXXTYmyPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNY1p4QC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNY1p4QC"
Received: by smtp.kernel.org (Postfix)
	id 973551F000C6; Thu, 15 Oct 2026 14:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145971F000C4;
	Thu, 15 Oct 2026 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792073333;
	bh=GdoXHG5bqnh4NwCzY9m6y5Cx4zqJ7XqMbkkocsvwNOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BNY1p4QCL0oIiTL2fI5ik+0MCQudAA/Gn0LMTDbpBsfS8+DKESTremjfjuEFKznkW
	 pPgysHGuj8zv2V+HHnjDkspccjFTB9bTGMUKO9z/xFqWTEWVaPeQtxpLJX0ZIRRbNd
	 SYvy+6QWgPjSDOxFDlRFOwAQQOicIVIGvi53s+H6k0JywSrvzTl6SChNBkAasp6IHq
	 +wQ1yO5mEY3rbyaAcuPwIhpgZ+IZaWDODylV11LlSq0guVKXM55agrVfBzMyXTjr7S
	 EKjypgQnsCeDn3OhQnlrI7Z2hHY6ybk4UnwJsPDmzc8t1cg6ovtn3WT65fwiMe1XGN
	 jDHc04SGafCQA==
From: Brian Masney <masneyb@kernel.org>
Date: Thu, 15 Oct 2026 10:08:41 -0400
Subject: [PATCH b4 1/3] review: centralize lookup of patchwork key in one
 place
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-pw-key-command-v1-1-6daa9b8cee2a@kernel.org>
References: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>
In-Reply-To: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4941; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=CEzGH1j2HrHNO4YSf5Sy1dlmIBM0BnJvLvlM/ETRo4o=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIu3Cv4xvTt3b3GudN08mdNfPJSPs3kUOTvZXqRrx/9e
 vdnibrWmY5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmsk6akWHacb3ezubTLP0a
 hhMFWWw26ezi1rnc5TDfStUi1bnzhxXD/9gF34U9N9+pc1OoTdZd15RQ99z80DKxnY/PXC5e/sj
 uAxcA
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
2.55.0


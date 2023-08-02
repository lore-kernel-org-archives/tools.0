Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CED84C7D
	for <tools@linux.kernel.org>; Wed,  2 Aug 2023 07:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E9B1C433C9;
	Wed,  2 Aug 2023 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690962018;
	bh=wV4xBnpQ5XJlzkXbYnpUckEdYQIK6cGu5Bp58WiDQAk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NYzAbNIO4ayd/0zeGljwK3XJ0leMZQTMdpSQX8eUX8TeY1ljwH7oV6Hb6qYI+Iwsc
	 488mFf3LyB3dhWoM8jPQhBHrEQjqZbcGUKOtA9Mf+PhcwIfdg3QwR/9AuxMR5s9zHL
	 L6pHy99b3lZ9v7SKtOovi7ArZ07abn9+TPx4TIK4GAhlHynh+kauD156PETYPprb2W
	 +iQzZDOmX+x6y13nV3hgxyZM+aTuYgnaY1i+Py0DZ60hsnOoGwc2YCaN+pZeu5IkX0
	 Ce4GCv7104jDbfgjGlEpNaTusHQUh+hWMs3oPN4iMYNSOyix1FmuEwt8sy/xZeMDW2
	 VuVZ3sKntlfNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6112BC001DE;
	Wed,  2 Aug 2023 07:40:18 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 02 Aug 2023 09:39:41 +0200
Subject: [PATCH b4 v2] ez: Add --use-web-endpoint arg to force web endpoint
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230802-jag-add_web_switch-v2-1-2e789cf3e0a0@samsung.com>
X-B4-Tracking: v=1; b=H4sIADwIymQC/32NXQqDMBCEryL73JRkKzX0qfcoIjHZ6hb8IWu1R
 XL3Bg/Qx2+G+WYHocgkcCt2iLSy8DRmwFMBvndjR4pDZkCNF221US/XKRdCs1HbyMaL71WJrkR
 bVVdLAfJwjvTkzyF9QFtCnbOeZZni9/hZzdH8U65GGeW0RuMNkfV4FzfIe+zOfhqgTin9AG8Nd
 fe6AAAA
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-eb842
X-Developer-Signature: v=1; a=openpgp-sha256; l=3609;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=v/P3hZEDhU1rt74JNOHul1KNCXUklMY6qBaKlRpD22A=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBkyghhceA7+RyLTZP4g988+Ei81retoTZdYw4QA
 tlpj7jTebOJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZMoIYQAKCRC6l81St5ZB
 TyDgC/9nLhOLw9fXuhwUuUKiX2RiU2Kke0+GIVWs3PU0P7buIDaCTdZg00g4AyQo36F1yQsm/NA
 SePs5Gkzrc1GNE/CHk3AJT7dsgePKmh6425oa2BKaSLS4aO5M2Cgjf4bImEFO024FyA/kQ6TRT3
 vWnSchaCIK3moTKhebgE53frGei7CqfVPazHU8+SUO+wqTTxm3CFWVEAEkYco7yqJUFX5c0Q0E7
 zRlNVN9Q9u3l/7vCrVNyQZ3P5NqSO144UzWzV+TSw0VhGVEsAQZSHRakXrt/DDhRxXCVKl1cFj/
 DN7T9gDyoiyJVlcJbejWWC5j6mvYQ1HnZ2MyI62W3v9POS4o425GifMSwavGvsLa/76KKwzq8SI
 UihihcIzWf+6RnEBxGUZwdB6q6k6H5cDTUr0rOgQ3q9oal6+jVIUPoGmxqkYlssoRB/pBeBbh8X
 KIQgpXUVpCYIdWrIPjy0XbbyVN86pQgGNeF7cDQm+Iveix86KkQPeXuWoJZZbFhUBaWN0=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:
 by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
Reply-To: <j.granados@samsung.com>

From: Joel Granados <j.granados@samsung.com>

Make it easier to prefer going through the web endpoint by adding an
argument that will force this path. This is for users that want to use
B4 for preparing and sharing patchsets over mail and need an argument to
activate the web endpoint whenever needed, but want to default to smtp
server for the rest.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
Changes in v2:
* Changed arg name from --web to --use-web-endpoint.
* Moved the argument to the main arguments group.
* Updated the doc so it still makes sense.
---
 b4/command.py             |  2 ++
 b4/ez.py                  |  4 +---
 docs/contributor/send.rst | 10 ++++++----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/b4/command.py b/b4/command.py
index 1ae73d2..71c1abd 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -130,6 +130,8 @@ def setup_parser() -> argparse.ArgumentParser:
                         help='Do not perform any network queries')
     parser.add_argument('--no-stdin', action='store_true', default=False,
                         help='Disable TTY detection for stdin')
+    parser.add_argument('--use-web-endpoint', dest='send_web', action='store_true', default=False,
+                        help="Force going through the web endpoint")
 
     subparsers = parser.add_subparsers(help='sub-command help', dest='subcmd')
 
diff --git a/b4/ez.py b/b4/ez.py
index 3799e07..e38827f 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1459,10 +1459,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         pathlib.Path(cmdargs.output_dir).mkdir(parents=True, exist_ok=True)
 
     sconfig = b4.get_sendemail_config()
-    # If we have an smtp server defined, always use that instead of the endpoint
-    # we may make this configurable in the future, but this almost always makes sense
     endpoint = None
-    if not sconfig.get('smtpserver'):
+    if not sconfig.get('smtpserver') or cmdargs.send_web:
         endpoint = config.get('send-endpoint-web', '')
         if not re.search(r'^https?://', endpoint):
             logger.debug('Endpoint does not start with https, ignoring: %s', endpoint)
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index 9be8d1c..8454f37 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -124,9 +124,10 @@ You should now be able to send patches via this web submission endpoint.
 
 Using your own SMTP server
 --------------------------
-B4 will use the ``sendemail`` section from your git configuration, but
-it only supports the most common subset of options. The vast majority of
-servers will only need the following settings::
+If there is a ``sendmail`` section in your git configuration, B4 will try use
+that by default instead of the web endpoint. Only the most common subset of
+options are supported. The vast majority of servers will only need the
+following settings::
 
     [sendemail]
        smtpServer = smtp.example.org
@@ -136,7 +137,8 @@ servers will only need the following settings::
        smtpPass = [omitted]
 
 You can also set up msmtp or a similar tool and specify the path to the
-``sendmail``-compliant binary as the value for ``smtpServer``.
+``sendmail``-compliant binary as the value for ``smtpServer``. You can force B4
+to use the web endpoint by using the ``--use-web-endpoint`` argument.
 
 Sending your patches
 --------------------

---
base-commit: 099c9b47b39b6076752b8c757872080fad8fae56
change-id: 20230801-jag-add_web_switch-42a4287768ed

Best regards,
-- 
Joel Granados <j.granados@samsung.com>


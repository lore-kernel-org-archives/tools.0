Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795569437;
	b=5epJvPguR6AkkkTFTGeQENSV9uuSe413dNG2J2QnoM6Jd0RfEDhwvl7qbmaJe2da230J
	 94dWNja385WrGS7R2WYdWEsfOSmoG+VH5fQbr+Q7BfvDevx9+XTZZ90M/tpl+oKc6MwEh
	 fxxVQ8WAwdS8iek9a05XHLI6aLfVlTdcp/s7CYtkHo4RjsYDAdwj7+VffL00qzeQoUi4O
	 Ssw0r4dkD9SdO6MUT74qXKcP73SKTysEdlMFjrUCLfqr4ASDV2g/XwcHHVZp5KW4sr542
	 419fD10CyJ2O6AZC9Tv+YI3aqekUsJlDfrkAYmfg2D4KzD9LL94OD6ByEooEAR67g0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569437;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=AJg8p5Bysr5IEh0tJ/2jWr18olyhogwaU8YY51Jyxl8=;
	b=oM02ASijwkE76s6Rma9pcuIf7rGOx3PWHcRnO1XQU/vuw8sKCJOATYNQg+KEBc2hMxoR
	 OlyMUjo5NC/KP++GumUIY07uoTbJHmdTYNV9jbrLh9mueMjDT//vGS38zop/i7EdLx3RD
	 mBLCfxvIMz49yXuNrBjCelb/ie++wmp16pOCWWXk0t+jzYiZsxSHzff/54IemeZr1zkjR
	 PemYoDrC2myqQiMnQZQeRjAswZTszJ0qgrR0mwY06A/6mtY72gV7keA9BxeCa/GilhEcq
	 QEP+oowcdQ6Yghpz5Yf7KFNA/sNB2tARJYRRxQey0WlG5FJdv5Sj9N4dDI+jI5JIv0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTqR2Owa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFC6606A31E
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 01:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTqR2Owa
Received: by smtp.kernel.org (Postfix)
	id 476491F000CF; Wed, 25 Nov 2026 01:17:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795569436;
	b=Eaz6MOTRjAbogS4yUXaMnKeW9mx3Clzge6odx9P0Hkfeq36As13rZ1eWrsHk2OTEfJq5
	 qNDUfmdmfJ7BVhJHo+dXv8CMmv9iiyjLn5dbbOCXml522uHm2VGwQ6Nqe+u39aj+8YHLC
	 8xjNIRuudeW7uhOgtmgSyyFTeOjpIFj1/U7RH9SnJU76Rf6Hasoqnt3cdSNnCQWF7oPyO
	 OB9tkxrS0DpAvkEYjj6ib9FEE2vJnPsEtlc8HegcxeeWl6U1rlZ1IB97w5QxNmD2NU1bZ
	 iSyWQkh8A4AY93ON32+rAW+L8numfzgsnNABSszicsArCpUjU6IOj3lar1VtkhhuJtw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795569436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=AJg8p5Bysr5IEh0tJ/2jWr18olyhogwaU8YY51Jyxl8=;
	b=ofRNDkWFJrOLOEXlSwxrkAL/Grp8wvq+K4by5w1cKSOFN0c0o9/GeM9gq9tVuyZUPfkh
	 m9VW/pv5v3HmE/pSpHG1tIxSUZguvq3KJWTMmJhn1MN6cNG+pMSQvMYIIi2rQqTcCOc4b
	 86BeVPX0yyc1uDo1H806j7m43JxFr/CRV76hYxC0ewJieAz7rpdcESV/u/ERCRE1flKCV
	 61XsHyD8+pcRw/dDFNKnk9/+AgdcDi6s9DXMGfWBLY4eCTnC7FbtXnQn5p8btUoiO3Zd4
	 mi9NAXJ0z7ZRdRTdOQWlMcX6UiBW2J8aSHpoLCFWUQ+vXyTyPialzhN/3I4gTM0qoCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTqR2Owa;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0056B1F000D1
	for <tools@kernel.org>; Wed, 25 Nov 2026 01:17:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTqR2Owa
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0056B1F000D1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b24f4b15c4so2131046c88.1
        for <tools@kernel.org>; Tue, 24 Nov 2026 17:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795569427; x=1796174227; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AJg8p5Bysr5IEh0tJ/2jWr18olyhogwaU8YY51Jyxl8=;
        b=FTqR2Owa5XIHILosUrar2DEUrmaiwRNNxHw7q1EmUuInqK97FGUGw4GXo1DCAl5gpq
         ZwKLc+GDWZZMM0NtGCbr1wzfhY/UhLBW2u+5q6bGKH2RUEaAbvJdfdyjFyL7OLF0txJE
         J9/ByZpkEtiGETGjl87j49Yx7z7zLa+MrMhQ/5ylqa4Czrd4FCKUM6itY44z7nTbCCyu
         tFolxjWCl/5SIBNmA9dORpJLm7dCLy/A2neHP3rdXQkyz9PQi3wnwWZpd36kAMCIWD2l
         D4TAB5HCB9d/POS6MNZTANUI8jFiePfvoZXCY58tKTUP89DIeE5W+tl+0zh/D3TlyNKL
         Oexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795569427; x=1796174227;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AJg8p5Bysr5IEh0tJ/2jWr18olyhogwaU8YY51Jyxl8=;
        b=Ie9bbpmqCtXt/pCjOoQQEjeSP96hEZqVdt6wBIEnoZb2P6q+QaqKcKw7/OWhQsg7pE
         uoSswvQr9qWVM4F29RNFhGhmFEH/ra8dF4l3T+ank/9QnavKWBMfURlf4KikJTTsIxic
         yt69C7pPPReZ0WjkW2S4d3PpjbiGfHtBMlnFiOOKLyBXM/6qxzA/eDRMLHKBaNXsJUZJ
         LdjGJpqFYxP0ULBBZH44QHQjinnifsUBiS0Vz2XBuHQWDVJEkwx0ilsQnx+SzwsF1DUI
         d5tJcZBeTz7Wip8EK0KE+iDiZnVrPyDLW7fcwEs2xgsQHiuYkX0J++BPs1gsM2uXCRXo
         c2PA==
X-Gm-Message-State: APuU4Z+Xe2EZaMaREIoGgNJsnmGBbzwGFUEtwi7HQb89ZIVlL1k/usiq
	QDZxU0EH53v7CC3fbpVbFa/LYHh34NiJSc4DcWmaGCrLzj8bMtuoszOw
X-Gm-Gg: AZFdTZdW8lVUVJInFs0guy/Q9sxmSe9Fa1XgJrE5tOrbBTIKTEMGExhUi3J/vO1f6B9
	2+/NkH3sZE0wfXJkW3t7e8PmWd1QktYT7Ed9ipQaUK+5GMQtqzlTh4WpyTDTeLzao/tzm4Y+LcM
	PdkCYOZFuNdEwrzdVvhWHm3U1jVQT/0wndmdd+ZEHWElD+capmFep301UhwppHrpuOKaYJHAvmA
	GM9wLDqC7Iflck+/YfBB6iam5xjU/12PVihpRNjB0GRXMGy+RdB0eVfygmOvayh8mbzSeMrHSnI
	c33rlK+MafLCMdJ7nhOCLxvne+LyZeKM4OS+CjACVMMutKQl4RJ0bLQi99ahy9yFH/VZCBa8VNq
	iAscOYVQMS/fthh5S/yWz3mvBhtLnRHivisR6idzuSAZbhElcEXi7YnCkBzfylRZOc/2ds3pvOY
	YT7LT9rx/EVjrzbAhM2dW8Qt33RPlXIMcb1XGASMPEiFTu2hLNHueB+KuPOHab0r0CVdo8+5DIj
	jyNoB6bsCsInT1ScZrOzY2HyzzsXKrv+RNoZe3zrGpZCp80vRkRY3mcF+0yLX3oRpXAqmS/8u67
	3/mxnhghdtEY0QEVtv/HiT4wGTexeJcEF8UjVvDM7Cn52zJRv6QyAxYL7JloXdw9XvfAHu3g3Uj
	Dn5rTwP+iuyidmE715w==
X-Received: by 2002:a05:701b:2319:b0:1b3:a8fc:6306 with SMTP id a92af1059eb24-1b55247e725mr15367069c88.6.1795569426521;
        Tue, 24 Nov 2026 17:17:06 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm36833817c88.3.2026.11.24.17.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:17:05 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 24 Nov 2026 17:16:51 -0800
Subject: [PATCH b4] am/shazam/pr: allow suppressing thanks records
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-suppress-thanks-v1-1-a0270ecee6bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAI3BmsC/yWMywqDMBBFf0XuuoEktUH6K9KFj1FHQSVjRBD/v
 VO7PPdwzwmhyCR4Zyci7Sy8zArukaEZqrknw60yvPXBOZ8bSesaScRsqicx3r1C8SQbis5CXyo
 7Pu5iiTrH579Jqkdqtl8K1/UF+fR13HcAAAA=
X-Change-ID: 20261124-suppress-thanks-215683e068f0
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev

Recording retrieved series and pull requests for later b4 ty use is
helpful for maintainers who send automated thank-you notes, but it
accumulates unwanted tracking files for contributors, one-off fetches,
or maintainers who prefer to write replies themselves.

Add a b4.thanks-record boolean configuration option (defaulting to yes)
and matching --thanks-record / --no-thanks-record flags on b4 am,
b4 shazam, and b4 pr so tracking can be disabled by default or
overridden per invocation. Invalid configuration values warn and fall
back to the default.

Decouple Patchwork review-state updates from writing thanks records so
b4.pw-review-state continues to work when thanks tracking is suppressed,
while keeping read-only checks and pull-request explosion unaffected.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 docs/config.rst               |  11 +++
 docs/maintainer/am-shazam.rst |   8 ++
 docs/maintainer/pr.rst        |   8 ++
 docs/maintainer/ty.rst        |   4 +
 src/b4/__init__.py            |  18 ++++
 src/b4/command.py             |  12 +++
 src/b4/mbox.py                |  41 ++++++---
 src/b4/pr.py                  |  26 ++++--
 src/tests/test___init__.py    | 102 ++++++++++++++++++++-
 src/tests/test_mbox.py        | 200 ++++++++++++++++++++++++++++++++++++++++++
 src/tests/test_pr.py          | 151 +++++++++++++++++++++++++++++++
 11 files changed, 559 insertions(+), 22 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 76ea4ae..bc86e47 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -722,6 +722,17 @@ Attestation settings
 
      Default: ``None``
 
+   :term:`b4.thanks-record`
+     Whether ``b4 am``, ``b4 shazam``, and ``b4 pr`` record information
+     about applied or fetched series and pull requests so that ``b4 ty``
+     can later generate thank-you messages for them. Can be overridden per
+     invocation with ``--thanks-record`` or ``--no-thanks-record``. Does
+     not affect :term:`b4.pw-review-state` updates.
+
+     Default: ``yes``
+
+     .. versionadded:: v0.17
+
    :term:`b4.thanks-treename`
      Name of the tree to use in the thank-you templates.
 
diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index f63cf3b..6608106 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -207,6 +207,14 @@ The following flags are common to both commands:
 
   .. versionadded:: v0.14
 
+``--thanks-record, --no-thanks-record``
+  Controls whether b4 records retrieved series for future ``b4 ty``
+  thank-you generation. Overrides the :term:`b4.thanks-record`
+  configuration setting. Does not affect :term:`b4.pw-review-state`
+  updates.
+
+  .. versionadded:: v0.17
+
 Flags only valid for ``b4 am``
 ------------------------------
 The following flags only make sense for ``b4 am``:
diff --git a/docs/maintainer/pr.rst b/docs/maintainer/pr.rst
index ca0310d..838fdef 100644
--- a/docs/maintainer/pr.rst
+++ b/docs/maintainer/pr.rst
@@ -32,6 +32,14 @@ Optional flags
 ``-c, --check``
   Check if the specified pull request has already been applied.
 
+``--thanks-record, --no-thanks-record``
+  Controls whether b4 records retrieved pull requests for future
+  ``b4 ty`` thank-you generation. Overrides the :term:`b4.thanks-record`
+  configuration setting. Does not affect :term:`b4.pw-review-state`
+  updates.
+
+  .. versionadded:: v0.17
+
 Exploding pull requests
 -----------------------
 Pull requests are useful, but if the maintainer needs to do more than
diff --git a/docs/maintainer/ty.rst b/docs/maintainer/ty.rst
index d7f3090..509a5f8 100644
--- a/docs/maintainer/ty.rst
+++ b/docs/maintainer/ty.rst
@@ -22,6 +22,10 @@ directory:
 All of these files contain JSON data about the series or pull requests
 being tracked.
 
+If you do not want ``b4 am``, ``b4 shazam``, or ``b4 pr`` to record
+tracking files, pass ``--no-thanks-record`` on the command line or set
+:term:`b4.thanks-record` to ``no`` in your configuration.
+
 Using the Auto-Thankanator
 --------------------------
 If you've retrieved and applied some patches to your tree, you should be
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 075cff4..312bb30 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -351,6 +351,8 @@ DEFAULT_CONFIG: ConfigDictT = {
     'thanks-pr-template': None,
     # See thanks-am-template.example
     'thanks-am-template': None,
+    # Do we record thanks for b4 am, shazam, and pr?
+    'thanks-record': 'yes',
     # If this is not set, we'll use what we find in
     # git-config for gpg.program, and if that's not set,
     # we'll use "gpg" and hope for the better
@@ -5138,6 +5140,22 @@ def get_main_config() -> ConfigDictT:
     return MAIN_CONFIG
 
 
+def get_ty_track(cmdargs: argparse.Namespace) -> bool:
+    cli_val = getattr(cmdargs, 'thanks_record', None)
+    if isinstance(cli_val, bool):
+        return cli_val
+    config = get_main_config()
+    cfg_val = config.get('thanks-record', 'yes')
+    try:
+        return get_git_bool(str(cfg_val))
+    except ValueError:
+        logger.warning(
+            'WARNING: invalid b4.thanks-record value %r, using default (yes)',
+            cfg_val,
+        )
+        return True
+
+
 def get_data_dir(appname: str = 'b4') -> str:
     if 'XDG_DATA_HOME' in os.environ:
         datahome = os.environ['XDG_DATA_HOME']
diff --git a/src/b4/command.py b/src/b4/command.py
index 18713f9..7183e72 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -167,6 +167,12 @@ def cmd_am_common_opts(sp: argparse.ArgumentParser) -> None:
         default=False,
         help='Allow unicode control characters (very rarely legitimate)',
     )
+    sp.add_argument(
+        '--thanks-record',
+        action=argparse.BooleanOptionalAction,
+        default=None,
+        help='Record (or do not record) this series for future "thanks" generation',
+    )
     sa_g = sp.add_mutually_exclusive_group()
     sa_g.add_argument(
         '-l',
@@ -797,6 +803,12 @@ def setup_parser() -> argparse.ArgumentParser:
         default=False,
         help='Force a --dry-run on git-send-email invocation (use with -s)',
     )
+    sp_pr.add_argument(
+        '--thanks-record',
+        action=argparse.BooleanOptionalAction,
+        default=None,
+        help='Record (or do not record) this pull request for future "thanks" generation',
+    )
     sp_pr.add_argument(
         'msgid', nargs='?', help='Message ID to process, or pipe a raw message'
     )
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 817d617..c8f0ab3 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -212,6 +212,7 @@ def get_merge_base(
 
 def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -> None:
     config = b4.get_main_config()
+    ty_track = b4.get_ty_track(cmdargs)
     outdir = cmdargs.outdir
     if outdir == '-':
         cmdargs.nocover = True
@@ -519,7 +520,7 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             )
             logger.info(out.strip())
             if ecode == 0:
-                thanks_record_am(lser, cherrypick=cherrypick)
+                _record_am_state(lser, cherrypick, ty_track)
             sys.exit(ecode)
 
         base_commit = get_merge_base(topdir, first_body, lser, cmdargs)
@@ -618,7 +619,7 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
         except RuntimeError:
             sys.exit(1)
 
-        thanks_record_am(lser, cherrypick=cherrypick)
+        _record_am_state(lser, cherrypick, ty_track)
         _run_shazam_merge(
             topdir,
             merge_template=merge_template,
@@ -642,7 +643,32 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             '       git am %s%s', '-3 ' if cmdargs.threeway else '', am_filename
         )
 
-    thanks_record_am(lser, cherrypick=cherrypick)
+    _record_am_state(lser, cherrypick, ty_track)
+
+
+def _record_am_state(
+    lser: b4.LoreSeries, cherrypick: Optional[List[int]], ty_track: bool
+) -> None:
+    """Record thanks tracking (when enabled) and update Patchwork review state."""
+    if ty_track:
+        thanks_record_am(lser, cherrypick=cherrypick)
+    pw_record_am(lser, cherrypick=cherrypick)
+
+
+def pw_record_am(lser: b4.LoreSeries, cherrypick: Optional[List[int]]) -> None:
+    config = b4.get_main_config()
+    pwstate = config.get('pw-review-state', '')
+    if not isinstance(pwstate, str) or not pwstate:
+        return
+    msgids: List[str] = list()
+    for at, pmsg in enumerate(lser.patches[1:], 1):
+        if pmsg is None or not pmsg.has_diff:
+            continue
+        if cherrypick is not None and at not in cherrypick:
+            continue
+        msgids.append(pmsg.msgid)
+    if msgids:
+        b4.patchwork_set_state(msgids, pwstate)
 
 
 def thanks_record_am(lser: b4.LoreSeries, cherrypick: Optional[List[int]]) -> None:
@@ -652,7 +678,6 @@ def thanks_record_am(lser: b4.LoreSeries, cherrypick: Optional[List[int]]) -> No
     filename = '%s.am' % slug
 
     patches = list()
-    msgids = list()
     at = 0
     padlen = len(str(lser.expected))
     lmsg = None
@@ -675,9 +700,6 @@ def thanks_record_am(lser: b4.LoreSeries, cherrypick: Optional[List[int]]) -> No
             at += 1
             continue
 
-        # Add it for patchwork state tracking
-        msgids.append(pmsg.msgid)
-
         if pmsg.pwhash is None:
             logger.debug(
                 'Unable to get hashes for all patches, not tracking for thanks'
@@ -722,11 +744,6 @@ def thanks_record_am(lser: b4.LoreSeries, cherrypick: Optional[List[int]]) -> No
         json.dump(out, fh, ensure_ascii=False, indent=4)
         logger.debug('Wrote %s for thanks tracking', filename)
 
-    config = b4.get_main_config()
-    pwstate = str(config.get('pw-review-state', ''))
-    if pwstate:
-        b4.patchwork_set_state(msgids, pwstate)
-
 
 def save_as_quilt(am_msgs: List[EmailMessage], q_dirname: str) -> None:
     if os.path.exists(q_dirname):
diff --git a/src/b4/pr.py b/src/b4/pr.py
index 7cf736d..4a5bc57 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -206,6 +206,7 @@ def fetch_remote(
     branch: Optional[str] = None,
     check_sig: bool = True,
     ty_track: bool = True,
+    pw_track: bool = True,
 ) -> int:
     # Do we know anything about this base commit?
     if lmsg.pr_base_commit and not b4.git_commit_exists(gitdir, lmsg.pr_base_commit):
@@ -256,10 +257,20 @@ def fetch_remote(
 
     if ty_track:
         thanks_record_pr(lmsg)
+    if pw_track:
+        pw_record_pr(lmsg)
 
     return 0
 
 
+def pw_record_pr(lmsg: b4.LoreMessage) -> None:
+    config = b4.get_main_config()
+    pwstate = config.get('pw-review-state', '')
+    if not isinstance(pwstate, str) or not pwstate:
+        return
+    b4.patchwork_set_state([lmsg.msgid], pwstate)
+
+
 def thanks_record_pr(lmsg: b4.LoreMessage) -> None:
     datadir = b4.get_data_dir()
     # Check if we're tracking it already
@@ -287,19 +298,13 @@ def thanks_record_pr(lmsg: b4.LoreMessage) -> None:
         json.dump(out, fh, ensure_ascii=False, indent=4)
         logger.debug('Wrote %s for thanks tracking', filename)
 
-    config = b4.get_main_config()
-    pwstate = config.get('pw-review-state', '')
-    assert isinstance(pwstate, str), 'pw-review-state must be a string'
-    if pwstate:
-        b4.patchwork_set_state([lmsg.msgid], pwstate)
-
 
 def explode(
     gitdir: Optional[str], lmsg: b4.LoreMessage, usefrom: Optional[str] = None
 ) -> List[email.message.EmailMessage]:
     import b4.ez
 
-    ecode = fetch_remote(gitdir, lmsg, check_sig=False, ty_track=False)
+    ecode = fetch_remote(gitdir, lmsg, check_sig=False, ty_track=False, pw_track=False)
     if ecode > 0:
         raise RuntimeError('Fetching unsuccessful')
 
@@ -458,6 +463,7 @@ def get_pr_from_github(ghurl: str) -> Optional[b4.LoreMessage]:
 
 
 def main(cmdargs: argparse.Namespace) -> None:
+    ty_track = b4.get_ty_track(cmdargs)
     gitdir = cmdargs.gitdir
     lmsg = None
 
@@ -599,7 +605,9 @@ def main(cmdargs: argparse.Namespace) -> None:
                 sys.exit(0)
             # We already have it locally, but record tracking info before
             # bailing out so that "b4 ty" remains possible for it later.
-            thanks_record_pr(lmsg)
+            if ty_track:
+                thanks_record_pr(lmsg)
+            pw_record_pr(lmsg)
             sys.exit(1)
 
         # Is it at the tip of FETCH_HEAD?
@@ -616,4 +624,4 @@ def main(cmdargs: argparse.Namespace) -> None:
         logger.info('Pull request does not appear to be in this tree.')
         sys.exit(0)
 
-    fetch_remote(gitdir, lmsg, branch=cmdargs.branch)
+    fetch_remote(gitdir, lmsg, branch=cmdargs.branch, ty_track=ty_track)
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 638753f..b43146c 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1,3 +1,4 @@
+import argparse
 import copy
 import email
 import email.message
@@ -11,7 +12,8 @@ import pathlib
 import smtplib
 import socket
 import sys
-from typing import Any, Callable, Dict, List, Literal, Optional, Set, Tuple, Union
+import types
+from typing import Any, Callable, Dict, List, Literal, Optional, Set, Tuple, Union, cast
 
 import dkim  # type: ignore[import-untyped]
 import dkim.dnsplug  # type: ignore[import-untyped]
@@ -22,6 +24,7 @@ import dns.rrset
 import pytest
 
 import b4
+import b4.command
 
 from .helpers.mail import make_msg
 
@@ -3332,3 +3335,100 @@ class TestGetPwKey:
         assert b4.MAIN_CONFIG.get('prep-pre-flight-checks') == 'disable-all'
         # The developer's own git config may set pw-user
         assert b4.MAIN_CONFIG.get('pw-user') != 'stolen'
+
+
+class TestGetTyTrack:
+    """Tests for b4.get_ty_track() CLI override, config parsing, and fallbacks."""
+
+    def test_default_is_true(self) -> None:
+        assert b4.get_ty_track(argparse.Namespace()) is True
+
+    @pytest.mark.parametrize(
+        'val,expected',
+        [
+            ('yes', True),
+            ('true', True),
+            ('1', True),
+            ('on', True),
+            ('y', True),
+            ('no', False),
+            ('false', False),
+            ('0', False),
+            ('off', False),
+            ('n', False),
+        ],
+    )
+    def test_valid_git_booleans(self, val: str, expected: bool) -> None:
+        b4.MAIN_CONFIG['thanks-record'] = val
+        assert b4.get_ty_track(argparse.Namespace(thanks_record=None)) is expected
+
+    def test_cli_no_thanks_record_overrides_yes(self) -> None:
+        b4.MAIN_CONFIG['thanks-record'] = 'yes'
+        parser = b4.command.setup_parser()
+        cmdargs = parser.parse_args(
+            ['--no-stdin', 'am', '--no-thanks-record', 'msg@example.com']
+        )
+        assert b4.get_ty_track(cmdargs) is False
+
+    def test_cli_thanks_record_overrides_no(self) -> None:
+        b4.MAIN_CONFIG['thanks-record'] = 'no'
+        parser = b4.command.setup_parser()
+        cmdargs = parser.parse_args(
+            ['--no-stdin', 'am', '--thanks-record', 'msg@example.com']
+        )
+        assert b4.get_ty_track(cmdargs) is True
+
+    @pytest.mark.parametrize(
+        'badval',
+        [
+            pytest.param('maybe', id='unrecognized'),
+            pytest.param('', id='empty'),
+            pytest.param(None, id='none'),
+            pytest.param(['yes'], id='list'),
+        ],
+    )
+    def test_invalid_config_warns_and_defaults_true(
+        self, caplog: pytest.LogCaptureFixture, badval: Any
+    ) -> None:
+        b4.MAIN_CONFIG['thanks-record'] = badval
+        with caplog.at_level(logging.WARNING, logger='b4'):
+            res = b4.get_ty_track(argparse.Namespace(thanks_record=None))
+        assert res is True
+        assert 'invalid b4.thanks-record value' in caplog.text
+
+    @pytest.mark.parametrize('cli_flag,expected', [(True, True), (False, False)])
+    def test_cli_override_skips_invalid_config_without_warning(
+        self, caplog: pytest.LogCaptureFixture, cli_flag: bool, expected: bool
+    ) -> None:
+        b4.MAIN_CONFIG['thanks-record'] = 'bogus'
+        with caplog.at_level(logging.WARNING, logger='b4'):
+            res = b4.get_ty_track(argparse.Namespace(thanks_record=cli_flag))
+        assert res is expected
+        assert 'thanks-record' not in caplog.text
+
+    def test_non_namespace_objects(self) -> None:
+        b4.MAIN_CONFIG['thanks-record'] = 'yes'
+        assert (
+            b4.get_ty_track(cast(argparse.Namespace, types.SimpleNamespace())) is True
+        )
+        assert (
+            b4.get_ty_track(
+                cast(argparse.Namespace, types.SimpleNamespace(thanks_record=False))
+            )
+            is False
+        )
+        assert b4.get_ty_track(cast(argparse.Namespace, object())) is True
+
+    def test_ignored_in_worktree_config(
+        self, gitdir: str, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A cloned tree's .b4-config must not suppress thanks-record."""
+        monkeypatch.setenv('GIT_CONFIG_GLOBAL', os.devnull)
+        monkeypatch.setenv('GIT_CONFIG_NOSYSTEM', '1')
+        wtcfg = pathlib.Path(gitdir) / '.b4-config'
+        wtcfg.write_text(
+            '[b4]\n\tthanks-record = no\n\tprep-pre-flight-checks = disable-all\n'
+        )
+        b4._setup_main_config(topdir=gitdir)
+        assert b4.MAIN_CONFIG.get('prep-pre-flight-checks') == 'disable-all'
+        assert b4.MAIN_CONFIG.get('thanks-record') == 'yes'
diff --git a/src/tests/test_mbox.py b/src/tests/test_mbox.py
index 25bac6d..19d5801 100644
--- a/src/tests/test_mbox.py
+++ b/src/tests/test_mbox.py
@@ -486,3 +486,203 @@ def test_merge_base_marker_unavailable_is_fatal(
     ):
         b4.mbox.get_merge_base(gitdir, body or cover_body, lser, cmdargs)
     assert e.value.code == 1
+
+
+@pytest.mark.parametrize(
+    'subcmd,extra_args,expect_exit',
+    [
+        pytest.param('am', ['-o', '.'], None, id='am'),
+        pytest.param('shazam', [], 0, id='shazam-direct'),
+        pytest.param('shazam', ['-H'], 0, id='shazam-H'),
+        pytest.param('shazam', ['-M'], 0, id='shazam-M'),
+    ],
+)
+@pytest.mark.parametrize(
+    'cfg_val,cli_flags,expect_record',
+    [
+        pytest.param('yes', [], True, id='default'),
+        pytest.param('yes', ['--no-thanks-record'], False, id='cli-no'),
+        pytest.param('no', [], False, id='config-no'),
+        pytest.param('no', ['--thanks-record'], True, id='cli-yes-overrides-no'),
+    ],
+)
+def test_thanks_record_am_and_shazam(
+    sampledir: str,
+    gitdir: str,
+    subcmd: str,
+    extra_args: List[str],
+    expect_exit: Optional[int],
+    cfg_val: str,
+    cli_flags: List[str],
+    expect_record: bool,
+) -> None:
+    mfile = os.path.join(sampledir, 'shazam-git1-just-series.mbox')
+    b4.MAIN_CONFIG['thanks-record'] = cfg_val
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        ['--no-stdin', '--no-interactive', '--offline-mode', subcmd, '-m', mfile]
+        + extra_args
+        + cli_flags
+    )
+    if expect_exit is not None:
+        with pytest.raises(SystemExit) as e:
+            b4.mbox.main(cmdargs)
+        assert e.value.code == expect_exit
+    else:
+        b4.mbox.main(cmdargs)
+
+    datadir = b4.get_data_dir()
+    amfiles = [f for f in os.listdir(datadir) if f.endswith('.am')]
+    if expect_record:
+        assert len(amfiles) == 1
+    else:
+        assert amfiles == []
+
+
+@pytest.mark.parametrize(
+    'subcmd,extra_args,expect_exit',
+    [
+        pytest.param('am', ['-o', '.'], None, id='am'),
+        pytest.param('shazam', [], 0, id='shazam-direct'),
+        pytest.param('shazam', ['-H'], 0, id='shazam-H'),
+        pytest.param('shazam', ['-M'], 0, id='shazam-M'),
+    ],
+)
+@pytest.mark.parametrize(
+    'cfg_val,cli_flags',
+    [
+        pytest.param('yes', ['--no-thanks-record'], id='cli-no'),
+        pytest.param('no', [], id='config-no'),
+    ],
+)
+def test_pw_review_state_runs_when_thanks_suppressed(
+    sampledir: str,
+    gitdir: str,
+    subcmd: str,
+    extra_args: List[str],
+    expect_exit: Optional[int],
+    cfg_val: str,
+    cli_flags: List[str],
+) -> None:
+    mfile = os.path.join(sampledir, 'shazam-git1-just-series.mbox')
+    b4.MAIN_CONFIG['thanks-record'] = cfg_val
+    b4.MAIN_CONFIG['pw-review-state'] = 'under-review'
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        ['--no-stdin', '--no-interactive', '--offline-mode', subcmd, '-m', mfile]
+        + extra_args
+        + cli_flags
+    )
+    with mock_patch('b4.patchwork_set_state') as mock_pw:
+        if expect_exit is not None:
+            with pytest.raises(SystemExit) as e:
+                b4.mbox.main(cmdargs)
+            assert e.value.code == expect_exit
+        else:
+            b4.mbox.main(cmdargs)
+
+    datadir = b4.get_data_dir()
+    assert [f for f in os.listdir(datadir) if f.endswith('.am')] == []
+    mock_pw.assert_called_once()
+    msgids, state = mock_pw.call_args[0]
+    assert len(msgids) == 4
+    assert state == 'under-review'
+
+
+def test_pw_record_am_edge_cases() -> None:
+    b4.MAIN_CONFIG['pw-review-state'] = 'under-review'
+    cover = make_msg(
+        'cover@example.com',
+        '[PATCH 0/3] Series',
+        body='Range-diff:\n' + MINIMAL_DIFF,
+    )
+    p1 = make_msg(
+        'p1@example.com',
+        '[PATCH 1/3] First',
+        body=MINIMAL_DIFF,
+        in_reply_to='cover@example.com',
+    )
+    p2 = make_msg(
+        'p2@example.com',
+        '[PATCH 2/3] Second',
+        body=MINIMAL_DIFF,
+        in_reply_to='cover@example.com',
+    )
+    p3 = make_msg(
+        'p3@example.com',
+        '[PATCH 3/3] Third',
+        body=MINIMAL_DIFF,
+        in_reply_to='cover@example.com',
+    )
+    lmbx = b4.LoreMailbox()
+    for m in (cover, p1, p2, p3):
+        lmbx.add_message(m)
+    lser = lmbx.get_series(codereview_trailers=False)
+    assert lser is not None
+    assert lser.patches[0] is not None
+    # Simulate a cover letter whose body triggered diff detection (e.g. inline range-diff)
+    lser.patches[0].has_diff = True
+    assert lser.patches[1] is not None
+    assert lser.patches[2] is not None
+    assert lser.patches[3] is not None
+
+    # Full series skips cover letter (slot 0) and still updates Patchwork when pwhash is None
+    with (
+        mock_patch.object(b4.LoreMessage, 'get_patchwork_hash', return_value=None),
+        mock_patch('b4.patchwork_set_state') as mock_pw,
+    ):
+        assert lser.patches[1].pwhash is None
+        b4.mbox.pw_record_am(lser, cherrypick=None)
+    mock_pw.assert_called_once_with(
+        ['p1@example.com', 'p2@example.com', 'p3@example.com'], 'under-review'
+    )
+
+    # Cherry-pick filters by patch index
+    with mock_patch('b4.patchwork_set_state') as mock_pw:
+        b4.mbox.pw_record_am(lser, cherrypick=[1, 3])
+    mock_pw.assert_called_once_with(
+        ['p1@example.com', 'p3@example.com'], 'under-review'
+    )
+
+    # None patch slot is skipped; empty msgids does not call patchwork_set_state
+    lser.patches[2] = None
+    with mock_patch('b4.patchwork_set_state') as mock_pw:
+        b4.mbox.pw_record_am(lser, cherrypick=[2])
+    mock_pw.assert_not_called()
+
+    # Empty patch list (cover-only) does not call patchwork_set_state
+    lser.patches = [lser.patches[0], None]
+    with mock_patch('b4.patchwork_set_state') as mock_pw:
+        b4.mbox.pw_record_am(lser, cherrypick=None)
+    mock_pw.assert_not_called()
+
+
+def test_am_cherrypick_updates_pw_state_when_thanks_suppressed(
+    sampledir: str, gitdir: str
+) -> None:
+    mfile = os.path.join(sampledir, 'shazam-git1-just-series.mbox')
+    b4.MAIN_CONFIG['pw-review-state'] = 'under-review'
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        [
+            '--no-stdin',
+            '--no-interactive',
+            '--offline-mode',
+            'am',
+            '-m',
+            mfile,
+            '-o',
+            '.',
+            '-P',
+            '2',
+            '--no-thanks-record',
+        ]
+    )
+    with mock_patch('b4.patchwork_set_state') as mock_pw:
+        b4.mbox.main(cmdargs)
+
+    assert [f for f in os.listdir(b4.get_data_dir()) if f.endswith('.am')] == []
+    mock_pw.assert_called_once()
+    msgids, state = mock_pw.call_args[0]
+    assert len(msgids) == 1
+    assert state == 'under-review'
diff --git a/src/tests/test_pr.py b/src/tests/test_pr.py
index bb62c33..648721d 100644
--- a/src/tests/test_pr.py
+++ b/src/tests/test_pr.py
@@ -414,3 +414,154 @@ def test_get_pr_from_github_error(monkeypatch: pytest.MonkeyPatch) -> None:
     monkeypatch.setattr(requests, 'session', lambda: sess)
     lmsg = b4.pr.get_pr_from_github('https://github.com/u/r/pull/42')
     assert lmsg is None
+
+
+# ---------------------------------------------------------------------------
+# b4.thanks-record / --thanks-record / --no-thanks-record and Patchwork state
+# ---------------------------------------------------------------------------
+@pytest.mark.parametrize(
+    'cfg_val,cli_flags,expect_record',
+    [
+        pytest.param('yes', [], True, id='default'),
+        pytest.param('yes', ['--no-thanks-record'], False, id='cli-no'),
+        pytest.param('no', [], False, id='config-no'),
+        pytest.param('no', ['--thanks-record'], True, id='cli-yes-overrides-no'),
+    ],
+)
+@pytest.mark.parametrize('already_present', [False, True])
+def test_main_thanks_record_options(
+    prremote: Dict[str, str],
+    monkeypatch: pytest.MonkeyPatch,
+    cfg_val: str,
+    cli_flags: List[str],
+    expect_record: bool,
+    already_present: bool,
+) -> None:
+    b4.MAIN_CONFIG['thanks-record'] = cfg_val
+    tip = (
+        b4.git_get_command_lines(None, ['rev-parse', 'HEAD'])[0]
+        if already_present
+        else None
+    )
+    msg, lmsg = _make_lmsg(prremote, tip=tip)
+    _patch_main_lookups(monkeypatch, msg, lmsg)
+    cmdargs = _parse_main_args(cli_flags)
+    if already_present:
+        with pytest.raises(SystemExit) as e:
+            b4.pr.main(cmdargs)
+        assert e.value.code == 1
+    else:
+        b4.pr.main(cmdargs)
+
+    prfile = os.path.join(b4.get_data_dir(), f'{lmsg.pr_tip_commit}.pr')
+    assert os.path.exists(prfile) is expect_record
+
+
+@pytest.mark.parametrize(
+    'cfg_val,cli_flags',
+    [
+        pytest.param('yes', ['--no-thanks-record'], id='cli-no'),
+        pytest.param('no', [], id='config-no'),
+    ],
+)
+@pytest.mark.parametrize('already_present', [False, True])
+def test_main_pw_review_state_runs_when_thanks_suppressed(
+    prremote: Dict[str, str],
+    monkeypatch: pytest.MonkeyPatch,
+    cfg_val: str,
+    cli_flags: List[str],
+    already_present: bool,
+) -> None:
+    b4.MAIN_CONFIG['thanks-record'] = cfg_val
+    b4.MAIN_CONFIG['pw-review-state'] = 'under-review'
+    pw_calls: List[Tuple[List[str], str]] = []
+    monkeypatch.setattr(
+        b4,
+        'patchwork_set_state',
+        lambda msgids, state: pw_calls.append((msgids, state)),
+    )
+    tip = (
+        b4.git_get_command_lines(None, ['rev-parse', 'HEAD'])[0]
+        if already_present
+        else None
+    )
+    msg, lmsg = _make_lmsg(prremote, tip=tip)
+    _patch_main_lookups(monkeypatch, msg, lmsg)
+    cmdargs = _parse_main_args(cli_flags)
+    if already_present:
+        with pytest.raises(SystemExit) as e:
+            b4.pr.main(cmdargs)
+        assert e.value.code == 1
+    else:
+        b4.pr.main(cmdargs)
+
+    prfile = os.path.join(b4.get_data_dir(), f'{lmsg.pr_tip_commit}.pr')
+    assert not os.path.exists(prfile)
+    assert pw_calls == [([lmsg.msgid], 'under-review')]
+
+
+def test_explode_does_not_update_pw_or_thanks(
+    prremote: Dict[str, str], monkeypatch: pytest.MonkeyPatch
+) -> None:
+    b4.MAIN_CONFIG['pw-review-state'] = 'under-review'
+    pw_calls: List[Tuple[List[str], str]] = []
+    monkeypatch.setattr(
+        b4,
+        'patchwork_set_state',
+        lambda msgids, state: pw_calls.append((msgids, state)),
+    )
+    _msg, lmsg = _make_lmsg(prremote)
+    msgs = b4.pr.explode(None, lmsg)
+    assert len(msgs) >= 1
+    assert pw_calls == []
+    assert [f for f in os.listdir(b4.get_data_dir()) if f.endswith('.pr')] == []
+
+
+def test_main_explode_does_not_update_pw_or_thanks(
+    prremote: Dict[str, str], monkeypatch: pytest.MonkeyPatch, tmp_path: Any
+) -> None:
+    b4.MAIN_CONFIG['pw-review-state'] = 'under-review'
+    pw_calls: List[Tuple[List[str], str]] = []
+    monkeypatch.setattr(
+        b4,
+        'patchwork_set_state',
+        lambda msgids, state: pw_calls.append((msgids, state)),
+    )
+    msg, lmsg = _make_lmsg(prremote)
+    _patch_main_lookups(monkeypatch, msg, lmsg)
+    outmbox = os.path.join(str(tmp_path), 'exploded.mbx')
+    cmdargs = _parse_main_args(['--explode', '--thanks-record', '-o', outmbox])
+    with pytest.raises(SystemExit) as e:
+        b4.pr.main(cmdargs)
+    assert e.value.code == 0
+    assert os.path.exists(outmbox)
+    assert pw_calls == []
+    assert [f for f in os.listdir(b4.get_data_dir()) if f.endswith('.pr')] == []
+
+
+@pytest.mark.parametrize(
+    'tip_is_head',
+    [
+        pytest.param(True, id='already-present'),
+        pytest.param(False, id='not-in-tree'),
+    ],
+)
+def test_main_check_does_not_update_pw_state(
+    prremote: Dict[str, str], monkeypatch: pytest.MonkeyPatch, tip_is_head: bool
+) -> None:
+    b4.MAIN_CONFIG['pw-review-state'] = 'under-review'
+    pw_calls: List[Tuple[List[str], str]] = []
+    monkeypatch.setattr(
+        b4,
+        'patchwork_set_state',
+        lambda msgids, state: pw_calls.append((msgids, state)),
+    )
+    head = b4.git_get_command_lines(None, ['rev-parse', 'HEAD'])[0]
+    tip = head if tip_is_head else None
+    msg, lmsg = _make_lmsg(prremote, tip=tip)
+    _patch_main_lookups(monkeypatch, msg, lmsg)
+    cmdargs = _parse_main_args(['--check'])
+    with pytest.raises(SystemExit) as e:
+        b4.pr.main(cmdargs)
+    assert e.value.code == 0
+    assert pw_calls == []

---
base-commit: b6d5eea11b04797b8f993b47ca4703d6d9d97f1b
change-id: 20261124-suppress-thanks-215683e068f0

Thanks.

-- 
Dmitry


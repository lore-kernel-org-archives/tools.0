Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837C733CEA2
	for <tools@linux.kernel.org>; Tue, 10 Feb 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711937; cv=none; b=utVEvc8ruyI4cC6aCpVnQX7bVzZKO0l+lwY9RSnU0qkzGvGUuhMOsla1AuX4uUhNXoEcpuZyUFP+IUx46MGPbvbXfNJbm8gehMsezOHOW6L9ikw/ESzpIwz0xvrnEaVkMCUQ+ZixuI6ew/wOJeYqcKdfcU1Q2poJ0STGhm7JEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711937; c=relaxed/simple;
	bh=CAW6PIuSVkY3wVKxy9LL80Tg8tM2gPq9xVlUM5NtW1A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qgbqlxghDIBRvv9IoPtOVMbp/Cv6GqzMMiQSul8B20IfoRpO/uG5bthzNITHm7oQMJSGunU1ygVLLltn0Bt6pladpwEWNGQ2dr6JNMgdxcl841z4h51XxOEL4DkDs8hDBIwCgZNWyH5yQ/JARN7mgMf8W4/zO0fsr1W8WiQ0mUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mj2J+Du2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mj2J+Du2"
Received: by smtp.kernel.org (Postfix)
	id 216ACC19424; Tue, 10 Feb 2026 08:25:37 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AF75C116C6
	for <tools@kernel.org>; Tue, 10 Feb 2026 08:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2AF75C116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so1583751f8f.0
        for <tools@kernel.org>; Tue, 10 Feb 2026 00:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770711929; x=1771316729; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFJNLBz5Q+3p5ze3CbvvFrur5z0kmkuwXVTaOfKgius=;
        b=mj2J+Du2eX0KIzPqZuOtTtecu79GOkiCVOhMcx8zbkpAQGE57MD/lOH9pYupzxU93y
         7yiGjwS9oLO0gBnt9p1DcmCeZrMywOYi1vzsM8QeeyxhDkwbvHx6pPLN6d86vSaSZeQa
         O5yq10XnYtiSpsrxPgneBL3ypoHJk4GkQiC080bZy/Tvu+vILnhTBsokQphp/I2kQcLj
         CfGLL9WZoI54hRgRrQjJegPSba/D2AIRmlP1JvlMeFiKmOLyBF2o6zo+aI8CmBEXg787
         Vzd1srIbcXMdUbPF8OimVi3HvWSjjZucpzNd7w4j2HJ3Zw7xPoEVKXpc1k6UHFcx76Bg
         2AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770711929; x=1771316729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFJNLBz5Q+3p5ze3CbvvFrur5z0kmkuwXVTaOfKgius=;
        b=rBwC1es9IUJu9kl+tCMe+BOYv8FpHOGMe/97J1wGyRXXvplw1no4y9mAtBz5i8XG/M
         G7FZTCMnR2GoU+H0bWPDR/n3S7IsfNYZ9ohA39CVE/h96NVyqWnbmWUWO8gTALjFEIfh
         QLhFPX9n5uLeHcDLb6mmNJDsJFQ8j3K1R1Lukir35oBUTqGNhP7IhvNBLTPIpWUTYYsc
         2KC8JSFV704PqKFvrFiw0JZ136dzKBGw4BJ3i/dKIjli737lUVYgEOJH2GvvpxqvSF70
         DN8jlePMmwH32sd1gFy5UPef0RMj0XLze+wB9/vN1xem8anW7LLKQd523yvzfSg/FRno
         9TQg==
X-Gm-Message-State: AOJu0YyPyi2kvvvsynkmvPI1ATvcwuAUUBQxO+ewghsNqFMiR3uyiaVl
	+IpJF+0AgHVRBRuFqZaSp1ENcQSUcnIq2Ej8b6KehI+S114e8veYYU5qIRXROS6L8qKVt88DC0x
	V5LVZ
X-Gm-Gg: AZuq6aLLFSTAaA9x8o8Ktlg26Px1OAz+qguAqBtG9W1WgQmuhS8xISnQgGPniemdNxf
	KPzTRUd2AuSsdtuJ3Bw2jxpTUO614/RUGkFNy8FY6+v703H85zrtc9YuN6zUodRKObVbjNRVGEw
	vvzyj/Qhs1qvF4s6Gl4Da1bO01Rd359GTQ0Vul8dO+9YT5FCGKQON9m3WQ1Hy6Hu6gJgAouDAeo
	EPuQ/RbOOJ7zBdzxyQQh8KAER416c5WbN8jModkRJ4tNl3ELk8VgeaiwBF/tubhLh6Qk0IpX4AP
	+i4ILNjICT7JoDuTOcpBX7JxbkSUgEJ2K/Dlya4MRCJz7MeC2Y6U71gD69AzAhXW5tmx8xrhpN5
	RtlV/dCR9levRc7MIi4iPPMpowLMPoLVYMff5mZtSAMlLGf5qv1bcqU88T0C/fw4QJ0YK9kWIj3
	YcUQbNzt3IlMHgihZK9P/gCA3MTFscAVy1gEk0rLeScbilzikJroRpfX62VnQlj7gn8TyS7XksS
	IP5DZBVRgJv3MY=
X-Received: by 2002:a5d:5848:0:b0:437:70d3:44e7 with SMTP id ffacd0b85a97d-43770d347dfmr6525384f8f.30.1770711929236;
        Tue, 10 Feb 2026 00:25:29 -0800 (PST)
Received: from localhost (p200300f65f20eb04dc7a4779994bfe83.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:dc7a:4779:994b:fe83])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-436296bd4desm32529896f8f.18.2026.02.10.00.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:25:28 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@kernel.org
Subject: [PATCH wotmate] export-keyring: Add option to update certificate header
Date: Tue, 10 Feb 2026 09:25:22 +0100
Message-ID: <20260210082521.1789192-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2758; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=CAW6PIuSVkY3wVKxy9LL80Tg8tM2gPq9xVlUM5NtW1A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpiuty6fJb0JTReMji7GacaIj2XSLdcyScyyrfL +rU8S+RnwuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYrrcgAKCRCPgPtYfRL+ Tmb5B/wJqGMR1uBYLfLFOqcI8JdGo2QFAn9EcE0wpZ7L0ZljNo0qOb93j1zJinYxlx95fvovUpX F4aZKwDtWB3whAQeHPQnGsarzsoZTp0hHkyLt+VUes2AXPurs6SLk2SDkiFbkuRpUI6AG56dCE3 kJiFqXM5Gjube2ZJtj6UhJIZQtvwAf+zmhf6rA64dOgD6Qjd0tv0bkrZckKol78XkxRzSOZQoev vZ6gkED2CMTfqSFSYit2EEnnmvPAR5oiemfFxSmASsr2cqT35oVzu+teRgWO/+JA5JHIVK9Ifch K0hYbsvJCfyTB91KLHv5WGrwjLfMgiaEjYv8Ntb/F3FZtpZL
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Sometimes the header changes even though the keydata did not. That
happens for example when a key expired or when the way the header is
generated changes (see e.g.
https://lore.kernel.org/tools/20260129100727.950475-2-u.kleine-koenig@baylibre.com/).

Add an option --update-header to write the certificate files in this
case, too.
---
 export-keyring.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 0208343c1b47..3aaba97f273b 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -67,6 +67,9 @@ if __name__ == '__main__':
     ap.add_argument('--gen-b4-keyring', action='store_true', dest='gen_b4_keyring',
                     default=False,
                     help='Generate a b4-style symlinked keyring as well')
+    ap.add_argument('--update-header', action='store_true', dest='update_header',
+                    default=False,
+                    help='Update certificate files also on header changes')
 
     cmdargs = ap.parse_args()
 
@@ -120,6 +123,11 @@ if __name__ == '__main__':
         keydata = wotmate.gpg_run_command(args, with_colons=False)
         keyout = os.path.join(keydir, '%s.asc' % kid)
 
+        # Now, generate the header
+        args = ['--list-options', 'show-notations', '--list-options',
+                'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
+        header = wotmate.gpg_run_command(args, with_colons=False)
+
         # Is there already a key file in place?
         key_changed = False
         if os.path.exists(keyout):
@@ -130,6 +138,10 @@ if __name__ == '__main__':
                 if keydata not in old_keyexport:
                     key_changed = True
                     logger.debug('Key changes detected for %s', kid)
+                elif cmdargs.update_header and header not in old_keyexport:
+                    key_changed = True
+                    logger.debug('Header changes detected for %s', kid)
+
         else:
             key_already_exists = False
             key_changed = True
@@ -170,10 +182,6 @@ if __name__ == '__main__':
             continue
 
         if key_changed:
-            # Now, export the header
-            args = ['--list-options', 'show-notations', '--list-options',
-                    'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
-            header = wotmate.gpg_run_command(args, with_colons=False)
             keyexport = header + b"\n\n" + keydata + b"\n"
 
             # Only do this for newly added keys

base-commit: 7d1694f954fe486332c3eac65b675a7c350ed7a6
prerequisite-patch-id: c81c44f6075762da9fba3ade5c6d67edffc5e5a3
-- 
2.47.3


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01C3A6F19
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860685; cv=none; b=VylNkHKDX23poNyzJ6NzYWl3/vDyxbwSr8sDfQp9q+LNaIfq6ItQFlpMGrW1GnYIj8yCzAW/hRVryB8V37d2wuQI0oxAh2N/X8d8rhQm2CnICBW/euse7WTLrRdgDP2VtZyRChPqAQQ5rDct/6AAmFCZktphHO9Z3VGRKt17Yac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860685; c=relaxed/simple;
	bh=UXOUcRw3w1nZQbbKb5oKSUoAnx7hT+bUcIqsyO2zruI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqMAcHnejSy6+AtB5BWm+PeUcDK4bBCIOQlaWuR1UxKoQtDAe28fXEbA83oX8VS5enYTnl84fi9ennnXoNzyC010AA++/CzO3hrwhNYirI1VKtOwEdiqv9xsrILdVcylgQqP1EDqbuLVCfWAmvHwzNugO3RVU4viv6U9/qZlHGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rb/5g8Up; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rb/5g8Up"
Received: by smtp.kernel.org (Postfix)
	id 0B3BCC2BCB1; Fri, 10 Apr 2026 22:38:05 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0F4FC19424
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0F4FC19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50b2b289925so20601551cf.2
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860681; x=1776465481; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6tLTE+SGzIuqrlL8YhG+/le49Tk5COtr4EpVrAKIj4=;
        b=Rb/5g8UpI35xwhpj6wxbe7ksfKV8+7HlCBmFdzHnsCsikLXCooxcYvQNO2F7Keo1En
         UTKUyRZstR6fa41jMKeN4CtbIM4B7hFcL0Amut9X1giAqwkLP9qY8jc+yx+bX39DJkKc
         ueBGodJN/BTepI01VqvnYIAiszPyVkHZDONBkdyXK7KG0JTBah8TL3YCrzvujhSeggNf
         kcXsjwz7VC7XYJl2LeUZS2cl5sj2a3UdLw11JLC+pXNXEtjcWYGm/AOVoa1Z518gsylx
         HyzHtWC8DL6yuVuaaY5B2MttM8JBErf4FksVkKkLVKniDhnEpMBBYEy0Dvt8A5skkA0y
         Wk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860681; x=1776465481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B6tLTE+SGzIuqrlL8YhG+/le49Tk5COtr4EpVrAKIj4=;
        b=nAr0anxAM8gnQOVfVRZFufMrZg1INYVGVEcye7lMSjs0qshKVh8vk1AFlHGzpKIhFZ
         DyVCRm0lmRnpVmvk6lbLON9U2tD0QOdy6jcHBJPv0Y1xZRyTw90wToXPf7T+6SdAgIxs
         IBNCDMZNFlbowI0dsbE9NfZmriOuq0myW0pNHIdXNhA6n0qS7h7lm1t3pQcGJGnLNUBt
         EW7ZIO0PPV0OCvyYeaJKUjeoGqXHd4dC3z5RhM4PS/yageiouLZUkZe4SihmKNkBdaHc
         d97HTkat0ITmLgghD70cVy64r8vry6K/tE6Bd7HY7WXret3XDA4AlwA/BF4llDSERuvm
         resw==
X-Gm-Message-State: AOJu0Yz6cDiR3NUeKSQ8fIAGtR4Z6/sV8IeuGtOD5SZlxbE7VRmpR1DV
	gQtOnnQKD7bXurCsrIV5k9tj+E4InNezEHlRhX5Ikk+1DTWgy6nvoUPp
X-Gm-Gg: AeBDiess0Dg9YyHa5E1QanGNI5DHQdO2vhHkDnEYDwWfmNUfjsfw1EZQXLtrrU6pWC1
	QpOZqQaCilTtj288U6WSB3zwSyvNf2SAdkjKJWJ7ojw5X9i3JTY7qOYNAwvSL0UgWjp/MSfkM7X
	hUYTtY0PMWOS5rDixTljKIg3jwgxbkrfMx30bXhkuo2zxO71pIT0v+dmJxDhb0lAV90jR47bqAJ
	pJVONP5NP8p324Yz+SOIj17Et6iBaPtKrUlshv9bHrtWPHLYYHRfuESGVGT17wKqIWhMXvjDwU6
	D1hskyKHDspUpypKGAzJ42T4Y9jSMDp0YLiCT8WkX3ECgxa1jHNyE3GxcN0N5BwX4ot4433JWZn
	HC+Rwt3nwQHIRR3mHTbgxkzEgEOYgF+1ZISbO9AMppq0MEyvCUFmxL+EXy9zf/YuvbawkYwaimh
	uqBQMsWCKZvECvMt8mHM9QK9CXoPXDKMqtei0bkwkx8HDpV5v4xNaJr7iah58A8QZOyf0tc/eAe
	Lm4V0J5i2I6HFDrJ8Vy/eLJ4GhscD58j8WfbkCA2LjNrnx5G2ZLgotUTw0tbOVyvV1cz6lIGJ/o
	igTM4Dx8I0bhh7iPiKoig6/OvVfEg+8hUPPOIM9c5fcZPZC/TqO4
X-Received: by 2002:ac8:5d14:0:b0:509:1e54:a501 with SMTP id d75a77b69052e-50dd5a81476mr68823931cf.9.1775860680381;
        Fri, 10 Apr 2026 15:38:00 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:37:59 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:37:55 -0400
Subject: [PATCH 04/14] Add ruff format check to CI
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-harden-type-checking-v1-4-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860674; l=57432;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=UXOUcRw3w1nZQbbKb5oKSUoAnx7hT+bUcIqsyO2zruI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QN/j0wxS1mh6EZKhrvz0D/0k+a+ULgoyUgAv9L6fnhD6IkVyBkKv0vs4R2aoZvi2LLXZeLYGFV+
 NPaXFvbvLMwY=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Enable ruff format checking in the b4 CI script and configure Ruff's
formatter in pyproject.toml.

Apply a one-time repo-wide format pass so the new check enforces the
current style without leaving the branch permanently red.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml             |   3 +
 src/liblore/__init__.py    |   1 +
 src/liblore/node.py        |  61 ++++++-----
 src/liblore/utils.py       |  86 +++++++++++-----
 tests/conftest.py          |   1 +
 tests/test_auth_headers.py |   4 +
 tests/test_cache.py        |  23 +++--
 tests/test_email_utils.py  |   2 +-
 tests/test_formatting.py   | 251 ++++++++++++++++++++++++++++-----------------
 tests/test_mbox.py         |   3 +
 tests/test_message.py      |   1 +
 tests/test_node.py         | 152 +++++++++++++++++++--------
 tests/test_thread.py       |   1 +
 tools/b4-ci-check.py       |   6 ++
 14 files changed, 400 insertions(+), 195 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 38be519..9bfadbe 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -59,3 +59,6 @@ ignore_missing_imports = true
 
 [tool.ruff.lint]
 extend-select = ["I"]
+
+[tool.ruff.format]
+quote-style = "single"
diff --git a/src/liblore/__init__.py b/src/liblore/__init__.py
index 1ffaaeb..2ba94e7 100644
--- a/src/liblore/__init__.py
+++ b/src/liblore/__init__.py
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2025-2026 The Linux Foundation
 """liblore — shared library for public-inbox / lore.kernel.org access."""
+
 import email.charset
 import email.policy
 from email.message import EmailMessage
diff --git a/src/liblore/node.py b/src/liblore/node.py
index 66da1d7..503428b 100644
--- a/src/liblore/node.py
+++ b/src/liblore/node.py
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2025-2026 The Linux Foundation
 """LoreNode — primary API for interacting with public-inbox servers."""
+
 from __future__ import annotations
 
 import concurrent.futures
@@ -49,7 +50,9 @@ def _get_config_from_git(
     try:
         result = subprocess.run(
             ['git', 'config', '-z', '--get-regexp', regexp],
-            capture_output=True, text=True, timeout=5,
+            capture_output=True,
+            text=True,
+            timeout=5,
         )
         if result.returncode != 0:
             return {}
@@ -99,7 +102,9 @@ def _get_subsection_config(
     try:
         result = subprocess.run(
             ['git', 'config', '-z', '--get-regexp', f'^{escaped}'],
-            capture_output=True, text=True, timeout=5,
+            capture_output=True,
+            text=True,
+            timeout=5,
         )
         if result.returncode != 0:
             return {}
@@ -114,7 +119,7 @@ def _get_subsection_config(
             key, value = entry.split('\n', 1)
         else:
             key, value = entry, 'true'
-        varname = key[len(prefix):].lower()
+        varname = key[len(prefix) :].lower()
         if varname in multivals:
             existing = config.get(varname)
             if not isinstance(existing, list):
@@ -168,7 +173,7 @@ class LoreNode:
 
         # Build the ordered list of origins to try
         self._all_origins: list[str] = []
-        for fb in (fallback_urls or []):
+        for fb in fallback_urls or []:
             fb = fb.rstrip('/')
             fb_parsed = urllib.parse.urlparse(fb)
             if not fb_parsed.scheme or not fb_parsed.netloc:
@@ -191,6 +196,7 @@ class LoreNode:
         if add_auth_headers:
             try:
                 import authheaders
+
                 self._authheaders = authheaders
             except ImportError:
                 raise LibloreError(
@@ -280,7 +286,9 @@ class LoreNode:
         # Try [liblore "<origin>"] first, fall back to [lore] for
         # lore.kernel.org.
         gitcfg = _get_subsection_config(
-            'liblore', origin, multivals=['fallback'],
+            'liblore',
+            origin,
+            multivals=['fallback'],
         )
         if not gitcfg and parsed.netloc == 'lore.kernel.org':
             gitcfg = _get_config_from_git(r'^lore\.', multivals=['fallback'])
@@ -334,7 +342,9 @@ class LoreNode:
         """
         return self._user_agent_plus
 
-    def set_user_agent(self, app_name: str, version: str, plus: str | None = None) -> None:
+    def set_user_agent(
+        self, app_name: str, version: str, plus: str | None = None
+    ) -> None:
         """Set the User-Agent to ``app_name/version`` (optionally ``+plus``).
 
         When *plus* is not provided, the value from ``lore.useragentplus``
@@ -415,7 +425,7 @@ class LoreNode:
 
     def _rewrite_url(self, url: str, origin: str) -> str:
         """Replace the canonical origin in *url* with *origin*."""
-        return origin + url[len(self._canonical_origin):]
+        return origin + url[len(self._canonical_origin) :]
 
     def _probe_cache_key(self) -> str:
         """Cache key for probe results, stable regardless of current order."""
@@ -596,12 +606,14 @@ class LoreNode:
             logger.debug('Trying %s %s', method, request_url)
             try:
                 resp: requests.Response = getattr(
-                    session, method.lower(),
+                    session,
+                    method.lower(),
                 )(request_url, **kwargs)
             except (requests.ConnectionError, requests.Timeout) as exc:
                 logger.warning(
                     'Request to %s failed (%s), trying next host',
-                    origin, exc,
+                    origin,
+                    exc,
                 )
                 last_exc = exc
                 continue
@@ -609,7 +621,8 @@ class LoreNode:
             if resp.status_code >= 500:
                 logger.warning(
                     'Request to %s returned %d, trying next host',
-                    origin, resp.status_code,
+                    origin,
+                    resp.status_code,
                 )
                 last_resp = resp
                 continue
@@ -622,9 +635,7 @@ class LoreNode:
             return last_resp
 
         if last_exc is not None:
-            raise RemoteError(
-                f'All hosts failed for {url}: {last_exc}'
-            ) from last_exc
+            raise RemoteError(f'All hosts failed for {url}: {last_exc}') from last_exc
 
         # last_resp must be a 5xx from the final origin
         assert last_resp is not None
@@ -650,7 +661,9 @@ class LoreNode:
             return None
         age = int(time.time() - st.st_mtime)
         if age > self._cache_ttl:
-            logger.debug('Cache expired (%ds > %ds): %s', age, self._cache_ttl, key[:12])
+            logger.debug(
+                'Cache expired (%ds > %ds): %s', age, self._cache_ttl, key[:12]
+            )
             try:
                 os.unlink(path)
             except OSError:
@@ -699,8 +712,12 @@ class LoreNode:
         for msg in msgs:
             msg_bytes = msg.as_bytes()
             auth_result = self._authheaders.authenticate_message(
-                msg_bytes, 'liblore',
-                dkim=True, dmarc=True, arc=True, spf=False,
+                msg_bytes,
+                'liblore',
+                dkim=True,
+                dmarc=True,
+                arc=True,
+                spf=False,
             )
             if auth_result:
                 # authheaders returns the full header line, so strip
@@ -785,7 +802,9 @@ class LoreNode:
                 return cached
 
         t_param = '&t=1' if full_threads else ''
-        query_url = self._url + '/?x=m' + t_param + '&q=' + urllib.parse.quote_plus(query)
+        query_url = (
+            self._url + '/?x=m' + t_param + '&q=' + urllib.parse.quote_plus(query)
+        )
         resp = self._request('POST', query_url, data='x=m')
         if resp.status_code != 200:
             raise RemoteError('Server returned an error: %s' % resp.status_code)
@@ -842,9 +861,7 @@ class LoreNode:
         if strict:
             strict_msgs = get_strict_thread(msgs, msgid)
             if not isinstance(strict_msgs, list) or not len(strict_msgs):
-                raise LookupError(
-                    'No messages found for msgid=%s' % msgid
-                )
+                raise LookupError('No messages found for msgid=%s' % msgid)
             msgs = strict_msgs
 
         if sort:
@@ -1013,9 +1030,7 @@ class LoreNode:
         for i, query in enumerate(queries):
             if i > 0:
                 time.sleep(0.1)
-            results.append(
-                self.get_thread_by_query(query, full_threads=full_threads)
-            )
+            results.append(self.get_thread_by_query(query, full_threads=full_threads))
         return results
 
     def validate(self) -> None:
diff --git a/src/liblore/utils.py b/src/liblore/utils.py
index e8926c6..04823bf 100644
--- a/src/liblore/utils.py
+++ b/src/liblore/utils.py
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2025-2026 The Linux Foundation
 """Message parsing, email utilities, threading, and mbox splitting."""
+
 from __future__ import annotations
 
 import datetime
@@ -36,6 +37,7 @@ _GTFROM_RE = re.compile(rb'^>+From ')
 # Header and message-ID utilities
 # =====================================================================
 
+
 def clean_header(hdrval: str | None) -> str:
     """Decode an RFC 2047 encoded header and normalise whitespace.
 
@@ -166,7 +168,6 @@ def msg_get_payload(
     return '\n'.join(stripped)
 
 
-
 # Adapted from email._parseaddr — RFC 5322 specials that require quoting
 _QSPECIALS = re.compile(r'[()<>@,:;.\"\[\]]')
 
@@ -187,7 +188,11 @@ def format_addrs(pairs: list[tuple[str, str]], clean: bool = True) -> str:
         if clean:
             name = clean_header(name)
         # Work around https://github.com/python/cpython/issues/100900
-        if not name.startswith('=?') and not name.startswith('"') and _QSPECIALS.search(name):
+        if (
+            not name.startswith('=?')
+            and not name.startswith('"')
+            and _QSPECIALS.search(name)
+        ):
             addrs.append(f'"{email.utils.quote(name)}" <{addr}>')
             continue
         if name.isascii():
@@ -216,7 +221,8 @@ def wrap_header(hdr: tuple[str, str], width: int = 75, nl: str = '\n') -> bytes:
         for addr in email.utils.getaddresses([hval]):
             if not addr[0].isascii():
                 enc_name = email.quoprimime.header_encode(
-                    addr[0].encode(), charset='utf-8')
+                    addr[0].encode(), charset='utf-8'
+                )
                 qp = format_addrs([(enc_name, addr[1])], clean=False)
             else:
                 qp = format_addrs([addr], clean=False)
@@ -236,14 +242,19 @@ def wrap_header(hdr: tuple[str, str], width: int = 75, nl: str = '\n') -> bytes:
                 return hdata.encode()
             # Trick: replace ': ' with ':_' so textwrap doesn't break there
             hdata = hdata.replace(': ', ':_', 1)
-            wrapped = textwrap.wrap(hdata, break_long_words=False,
-                                    break_on_hyphens=False,
-                                    subsequent_indent=' ', width=width)
+            wrapped = textwrap.wrap(
+                hdata,
+                break_long_words=False,
+                break_on_hyphens=False,
+                subsequent_indent=' ',
+                width=width,
+            )
             return nl.join(wrapped).replace(':_', ': ', 1).encode()
 
         # Non-ASCII: encode as RFC 2047 quoted-printable
         qp = f'{hname}: ' + email.quoprimime.header_encode(
-            hval.encode(), charset='utf-8')
+            hval.encode(), charset='utf-8'
+        )
         if len(qp) <= width:
             return qp.encode()
 
@@ -252,7 +263,7 @@ def wrap_header(hdr: tuple[str, str], width: int = 75, nl: str = '\n') -> bytes:
             if len(_parts):
                 wrapat -= 1
             # Don't break in the middle of a =XX escape sequence
-            while '=' in qp[wrapat - 2:wrapat]:
+            while '=' in qp[wrapat - 2 : wrapat]:
                 wrapat -= 1
             _parts.append(qp[:wrapat] + '?=')
             qp = '=?utf-8?q?' + qp[wrapat:]
@@ -434,8 +445,14 @@ DIFFSTAT_RE = re.compile(r'^\s*\d+ file.*changed', re.M)
 
 # Default set of headers to keep when minimizing messages.
 MINIMIZE_KEEP_HEADERS: tuple[str, ...] = (
-    'From', 'To', 'Cc', 'Subject', 'Date',
-    'Message-ID', 'Reply-To', 'In-Reply-To',
+    'From',
+    'To',
+    'Cc',
+    'Subject',
+    'Date',
+    'Message-ID',
+    'Reply-To',
+    'In-Reply-To',
 )
 
 
@@ -481,7 +498,11 @@ def minimize_thread(
 
         body = msg_get_payload(msg, strip_signature=False)
 
-        if not re.search(r'^>', body, re.M) or DIFF_RE.search(body) or DIFFSTAT_RE.search(body):
+        if (
+            not re.search(r'^>', body, re.M)
+            or DIFF_RE.search(body)
+            or DIFFSTAT_RE.search(body)
+        ):
             mmsg.set_payload(body, charset='utf-8')
             mmsgs.append(mmsg)
             continue
@@ -548,11 +569,15 @@ def minimize_thread(
                 skipped = last_break
                 if skipped <= 5:
                     continue
-                last_para = qchunk[last_break + 1:]
-                chunks[idx] = (True, [
-                    f'> [... skip {skipped} lines ...]',
-                    '>',
-                ] + last_para)
+                last_para = qchunk[last_break + 1 :]
+                chunks[idx] = (
+                    True,
+                    [
+                        f'> [... skip {skipped} lines ...]',
+                        '>',
+                    ]
+                    + last_para,
+                )
 
         parts: list[str] = []
         for _quoted, chunk in chunks:
@@ -599,7 +624,7 @@ def _get_raw_header(raw: bytes, name: str) -> str | None:
         if value is not None:
             break
         if line.lower().startswith(prefix):
-            value = line[len(prefix):].strip()
+            value = line[len(prefix) :].strip()
 
     if value is not None:
         return value.decode('ascii', errors='replace')
@@ -680,7 +705,8 @@ DEFAULT_LISTID_PREFERENCE: list[str] = [
 
 
 def _listid_preference_index(
-    listid: str | None, listid_preference: list[str],
+    listid: str | None,
+    listid_preference: list[str],
 ) -> int:
     """Return the preference index for a List-Id value.
 
@@ -716,16 +742,17 @@ def get_preferred_duplicate(
     if listid_preference is None:
         listid_preference = DEFAULT_LISTID_PREFERENCE
 
-    idx1 = _listid_preference_index(
-        get_clean_msgid(msg1, 'List-Id'), listid_preference)
-    idx2 = _listid_preference_index(
-        get_clean_msgid(msg2, 'List-Id'), listid_preference)
+    idx1 = _listid_preference_index(get_clean_msgid(msg1, 'List-Id'), listid_preference)
+    idx2 = _listid_preference_index(get_clean_msgid(msg2, 'List-Id'), listid_preference)
     if idx1 <= idx2:
-        logger.debug('Picked duplicate from preferred source: %s',
-                      get_clean_msgid(msg1, 'List-Id'))
+        logger.debug(
+            'Picked duplicate from preferred source: %s',
+            get_clean_msgid(msg1, 'List-Id'),
+        )
         return msg1
-    logger.debug('Picked duplicate from preferred source: %s',
-                  get_clean_msgid(msg2, 'List-Id'))
+    logger.debug(
+        'Picked duplicate from preferred source: %s', get_clean_msgid(msg2, 'List-Id')
+    )
     return msg2
 
 
@@ -799,9 +826,10 @@ def split_and_dedupe(
 
 
 # =====================================================================
-# Pure helpers 
+# Pure helpers
 # =====================================================================
 
+
 def get_msgid_from_url(url: str) -> str:
     """Extract a message ID from a lore.kernel.org URL.
 
@@ -809,7 +837,9 @@ def get_msgid_from_url(url: str) -> str:
     returned with angle brackets stripped.
     """
     if '://' in url:
-        matches = re.search(r'^https?://[^@]+/([^/]+(?:@|%40)[^/]+)', url, re.IGNORECASE)
+        matches = re.search(
+            r'^https?://[^@]+/([^/]+(?:@|%40)[^/]+)', url, re.IGNORECASE
+        )
         if matches:
             return urllib.parse.unquote(matches.groups()[0])
     return url.strip('<>')
diff --git a/tests/conftest.py b/tests/conftest.py
index ec8ec80..28fedaf 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Shared fixtures for liblore tests."""
+
 from __future__ import annotations
 
 import email.utils
diff --git a/tests/test_auth_headers.py b/tests/test_auth_headers.py
index 9097048..8cec624 100644
--- a/tests/test_auth_headers.py
+++ b/tests/test_auth_headers.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Tests for optional authheaders integration in LoreNode."""
+
 from __future__ import annotations
 
 import gzip
@@ -17,6 +18,7 @@ from liblore.node import LoreNode
 # Import-time validation
 # =====================================================================
 
+
 class TestAuthHeadersImport:
     def test_raises_when_authheaders_missing(self) -> None:
         with patch.dict(sys.modules, {'authheaders': None}):
@@ -41,6 +43,7 @@ class TestAuthHeadersImport:
 # _authenticate_msgs
 # =====================================================================
 
+
 class TestAuthenticateMsgs:
     def test_noop_when_disabled(self) -> None:
         node = LoreNode()
@@ -116,6 +119,7 @@ class TestAuthenticateMsgs:
 # Integration with fetch methods
 # =====================================================================
 
+
 class TestAuthInFetchMethods:
     @pytest.fixture()
     def auth_node(self, sample_mbox: bytes) -> LoreNode:
diff --git a/tests/test_cache.py b/tests/test_cache.py
index 9e7933b..b822e7c 100644
--- a/tests/test_cache.py
+++ b/tests/test_cache.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Tests for LoreNode filesystem caching."""
+
 from __future__ import annotations
 
 import gzip
@@ -82,7 +83,6 @@ class TestCacheReadWrite:
 
 
 class TestClearCache:
-
     def test_clears_cache_files(self, tmp_path: Path) -> None:
         node = LoreNode(cache_dir=str(tmp_path))
         node._cache_write(node._cache_key('a', '1'), b'data1')
@@ -104,7 +104,6 @@ class TestClearCache:
 
 
 class TestProperties:
-
     def test_url_property(self) -> None:
         node = LoreNode('https://lore.kernel.org/all/')
         # Trailing slash is stripped by constructor
@@ -122,8 +121,12 @@ class TestProperties:
 class TestCachedMethods:
     """Integration tests: verify cache hit avoids network, cache miss hits network."""
 
-    def _make_node(self, tmp_path: Path, sample_mbox: bytes) -> tuple[LoreNode, MagicMock]:
-        node = LoreNode('https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60)
+    def _make_node(
+        self, tmp_path: Path, sample_mbox: bytes
+    ) -> tuple[LoreNode, MagicMock]:
+        node = LoreNode(
+            'https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60
+        )
         mock_session = MagicMock()
         mock_resp = MagicMock()
         mock_resp.status_code = 200
@@ -158,7 +161,9 @@ class TestCachedMethods:
         assert mock_session.post.call_count == 2
 
     def test_get_message_by_msgid_caches(self, tmp_path: Path) -> None:
-        node = LoreNode('https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60)
+        node = LoreNode(
+            'https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60
+        )
         mock_session = MagicMock()
         mock_resp = MagicMock()
         mock_resp.status_code = 200
@@ -197,7 +202,9 @@ class TestCachedMethods:
         # tmp_path should be empty since we didn't set cache_dir to it
         assert list(tmp_path.iterdir()) == []
 
-    def test_fetch_thread_since_not_cached(self, tmp_path: Path, sample_mbox: bytes) -> None:
+    def test_fetch_thread_since_not_cached(
+        self, tmp_path: Path, sample_mbox: bytes
+    ) -> None:
         """_fetch_thread_since should NOT be cached."""
         node, mock_session = self._make_node(tmp_path, sample_mbox)
         node._fetch_thread_since('test@example.com', 'dt:20240101..')
@@ -207,7 +214,9 @@ class TestCachedMethods:
 
     def test_error_not_cached(self, tmp_path: Path) -> None:
         """Network errors should not be cached."""
-        node = LoreNode('https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60)
+        node = LoreNode(
+            'https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60
+        )
         mock_session = MagicMock()
         mock_resp = MagicMock()
         mock_resp.status_code = 404
diff --git a/tests/test_email_utils.py b/tests/test_email_utils.py
index 74216d4..9276010 100644
--- a/tests/test_email_utils.py
+++ b/tests/test_email_utils.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Tests for liblore.email_utils."""
+
 from __future__ import annotations
 
 from email.message import EmailMessage
@@ -100,7 +101,6 @@ class TestMsgGetPayload:
         assert msg_get_payload(msg) == ''
 
 
-
 class TestMsgGetRecipients:
     def test_to_cc_from(self) -> None:
         msg = EmailMessage(policy=emlpolicy)
diff --git a/tests/test_formatting.py b/tests/test_formatting.py
index cb3cf80..f179a3a 100644
--- a/tests/test_formatting.py
+++ b/tests/test_formatting.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Tests for email formatting and thread minimization."""
+
 from __future__ import annotations
 
 from email.message import EmailMessage
@@ -19,105 +20,168 @@ from liblore.utils import (
 # Adapted from b4 test_format_addrs — validates cpython#100900 workaround
 # and RFC 2047 handling in address formatting.
 class TestFormatAddrs:
-    @pytest.mark.parametrize('pairs,verify,clean', [
-        ([('', 'foo@example.com'), ('Foo Bar', 'bar@example.com')],
-         'foo@example.com, Foo Bar <bar@example.com>', True),
-        ([('', 'foo@example.com'), ('Foo, Bar', 'bar@example.com')],
-         'foo@example.com, "Foo, Bar" <bar@example.com>', True),
-        ([('', 'foo@example.com'), ('F\u00f4o, Bar', 'bar@example.com')],
-         'foo@example.com, "F\u00f4o, Bar" <bar@example.com>', True),
-        ([('', 'foo@example.com'), ('=?utf-8?q?Qu=C3=BBx_Foo?=', 'quux@example.com')],
-         'foo@example.com, Qu\u00fbx Foo <quux@example.com>', True),
-        ([('', 'foo@example.com'), ('=?utf-8?q?Qu=C3=BBx=2C_Foo?=', 'quux@example.com')],
-         'foo@example.com, "Qu\u00fbx, Foo" <quux@example.com>', True),
-        ([('', 'foo@example.com'), ('=?utf-8?q?Qu=C3=BBx=2C_Foo?=', 'quux@example.com')],
-         'foo@example.com, =?utf-8?q?Qu=C3=BBx=2C_Foo?= <quux@example.com>', False),
-    ])
-    def test_format_addrs(self, pairs: list[tuple[str, str]],
-                          verify: str, clean: bool) -> None:
+    @pytest.mark.parametrize(
+        'pairs,verify,clean',
+        [
+            (
+                [('', 'foo@example.com'), ('Foo Bar', 'bar@example.com')],
+                'foo@example.com, Foo Bar <bar@example.com>',
+                True,
+            ),
+            (
+                [('', 'foo@example.com'), ('Foo, Bar', 'bar@example.com')],
+                'foo@example.com, "Foo, Bar" <bar@example.com>',
+                True,
+            ),
+            (
+                [('', 'foo@example.com'), ('F\u00f4o, Bar', 'bar@example.com')],
+                'foo@example.com, "F\u00f4o, Bar" <bar@example.com>',
+                True,
+            ),
+            (
+                [
+                    ('', 'foo@example.com'),
+                    ('=?utf-8?q?Qu=C3=BBx_Foo?=', 'quux@example.com'),
+                ],
+                'foo@example.com, Qu\u00fbx Foo <quux@example.com>',
+                True,
+            ),
+            (
+                [
+                    ('', 'foo@example.com'),
+                    ('=?utf-8?q?Qu=C3=BBx=2C_Foo?=', 'quux@example.com'),
+                ],
+                'foo@example.com, "Qu\u00fbx, Foo" <quux@example.com>',
+                True,
+            ),
+            (
+                [
+                    ('', 'foo@example.com'),
+                    ('=?utf-8?q?Qu=C3=BBx=2C_Foo?=', 'quux@example.com'),
+                ],
+                'foo@example.com, =?utf-8?q?Qu=C3=BBx=2C_Foo?= <quux@example.com>',
+                False,
+            ),
+        ],
+    )
+    def test_format_addrs(
+        self, pairs: list[tuple[str, str]], verify: str, clean: bool
+    ) -> None:
         assert format_addrs(pairs, clean) == verify
 
 
 # Adapted from b4 test_header_wrapping — validates RFC 2047 encoding,
 # line wrapping, and proper handling of address vs non-address headers.
 class TestWrapHeader:
-    @pytest.mark.parametrize('hval,verify', [
-        # Short ASCII — no wrapping needed
-        ('short-ascii', 'short-ascii'),
-        # Short Unicode — RFC 2047 QP encoded
-        ('short-unic\u00f4de', '=?utf-8?q?short-unic=C3=B4de?='),
-        # Long ASCII — wrapped at word boundary
-        ('Lorem ipsum dolor sit amet consectetur adipiscing elit '
-         'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
-         'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do\n'
-         ' eiusmod tempor incididunt ut labore et dolore magna aliqua'),
-        # Long Unicode — split across multiple encoded lines
-        ('Lorem \u00eepsum dolor sit amet consectetur adipiscing el\u00eet '
-         'sed do eiusmod temp\u00f4r incididunt ut labore et dol\u00f4re magna aliqua',
-         '=?utf-8?q?Lorem_=C3=AEpsum_dolor_sit_amet_consectetur_adipiscin?=\n'
-         ' =?utf-8?q?g_el=C3=AEt_sed_do_eiusmod_temp=C3=B4r_incididunt_ut_labore_et?=\n'
-         ' =?utf-8?q?_dol=C3=B4re_magna_aliqua?='),
-        # Exactly 75 chars — boundary condition
-        ('Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiu',
-         'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiu'),
-        # Unicode on escape boundary
-        ('Lorem ipsum dolor sit amet consectetur adipiscin el\u00eet',
-         '=?utf-8?q?Lorem_ipsum_dolor_sit_amet_consectetur_adipiscin_el?=\n'
-         ' =?utf-8?q?=C3=AEt?='),
-        # Unicode 1 char too long
-        ('Lorem ipsum dolor sit amet consectetur adipi el\u00eet',
-         '=?utf-8?q?Lorem_ipsum_dolor_sit_amet_consectetur_adipi_el=C3=AE?=\n'
-         ' =?utf-8?q?t?='),
-    ])
+    @pytest.mark.parametrize(
+        'hval,verify',
+        [
+            # Short ASCII — no wrapping needed
+            ('short-ascii', 'short-ascii'),
+            # Short Unicode — RFC 2047 QP encoded
+            ('short-unic\u00f4de', '=?utf-8?q?short-unic=C3=B4de?='),
+            # Long ASCII — wrapped at word boundary
+            (
+                'Lorem ipsum dolor sit amet consectetur adipiscing elit '
+                'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
+                'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do\n'
+                ' eiusmod tempor incididunt ut labore et dolore magna aliqua',
+            ),
+            # Long Unicode — split across multiple encoded lines
+            (
+                'Lorem \u00eepsum dolor sit amet consectetur adipiscing el\u00eet '
+                'sed do eiusmod temp\u00f4r incididunt ut labore et dol\u00f4re magna aliqua',
+                '=?utf-8?q?Lorem_=C3=AEpsum_dolor_sit_amet_consectetur_adipiscin?=\n'
+                ' =?utf-8?q?g_el=C3=AEt_sed_do_eiusmod_temp=C3=B4r_incididunt_ut_labore_et?=\n'
+                ' =?utf-8?q?_dol=C3=B4re_magna_aliqua?=',
+            ),
+            # Exactly 75 chars — boundary condition
+            (
+                'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiu',
+                'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiu',
+            ),
+            # Unicode on escape boundary
+            (
+                'Lorem ipsum dolor sit amet consectetur adipiscin el\u00eet',
+                '=?utf-8?q?Lorem_ipsum_dolor_sit_amet_consectetur_adipiscin_el?=\n'
+                ' =?utf-8?q?=C3=AEt?=',
+            ),
+            # Unicode 1 char too long
+            (
+                'Lorem ipsum dolor sit amet consectetur adipi el\u00eet',
+                '=?utf-8?q?Lorem_ipsum_dolor_sit_amet_consectetur_adipi_el=C3=AE?=\n'
+                ' =?utf-8?q?t?=',
+            ),
+        ],
+    )
     def test_non_address_header(self, hval: str, verify: str) -> None:
         wrapped = wrap_header(('X-Header', hval))
         assert wrapped.decode() == f'X-Header: {verify}'
 
-    @pytest.mark.parametrize('hval,verify', [
-        # Single address
-        ('foo@example.com', 'foo@example.com'),
-        # Two addresses
-        ('foo@example.com, bar@example.com',
-         'foo@example.com, bar@example.com'),
-        # Mixed plain + display name
-        ('foo@example.com, Foo Bar <bar@example.com>',
-         'foo@example.com, Foo Bar <bar@example.com>'),
-        # Mixed Unicode — non-ASCII name gets QP encoded
-        ('foo@example.com, Foo Bar <bar@example.com>, F\u00f4o Baz <baz@example.com>',
-         'foo@example.com, Foo Bar <bar@example.com>, \n'
-         ' =?utf-8?q?F=C3=B4o_Baz?= <baz@example.com>'),
-        # Complex with quoted specials
-        ('foo@example.com, Foo Bar <bar@example.com>, '
-         'F\u00f4o Baz <baz@example.com>, "Quux, Foo" <quux@example.com>',
-         'foo@example.com, Foo Bar <bar@example.com>, \n'
-         ' =?utf-8?q?F=C3=B4o_Baz?= <baz@example.com>, '
-         '"Quux, Foo" <quux@example.com>'),
-        # Long local part forces line wrap
-        ('01234567890123456789012345678901234567890123456789012345678901@example.org, '
-         '\u00e4 <foo@example.org>',
-         '01234567890123456789012345678901234567890123456789012345678901@example.org, \n'
-         ' =?utf-8?q?=C3=A4?= <foo@example.org>'),
-        # cpython#100900 — Unicode name with RFC 5322 specials
-        ('foo@example.com, Foo Bar <bar@example.com>, '
-         'F\u00f4o Baz <baz@example.com>, "Qu\u00fbx, Foo" <quux@example.com>',
-         'foo@example.com, Foo Bar <bar@example.com>, \n'
-         ' =?utf-8?q?F=C3=B4o_Baz?= <baz@example.com>, \n'
-         ' =?utf-8?q?Qu=C3=BBx=2C_Foo?= <quux@example.com>'),
-    ])
+    @pytest.mark.parametrize(
+        'hval,verify',
+        [
+            # Single address
+            ('foo@example.com', 'foo@example.com'),
+            # Two addresses
+            ('foo@example.com, bar@example.com', 'foo@example.com, bar@example.com'),
+            # Mixed plain + display name
+            (
+                'foo@example.com, Foo Bar <bar@example.com>',
+                'foo@example.com, Foo Bar <bar@example.com>',
+            ),
+            # Mixed Unicode — non-ASCII name gets QP encoded
+            (
+                'foo@example.com, Foo Bar <bar@example.com>, F\u00f4o Baz <baz@example.com>',
+                'foo@example.com, Foo Bar <bar@example.com>, \n'
+                ' =?utf-8?q?F=C3=B4o_Baz?= <baz@example.com>',
+            ),
+            # Complex with quoted specials
+            (
+                'foo@example.com, Foo Bar <bar@example.com>, '
+                'F\u00f4o Baz <baz@example.com>, "Quux, Foo" <quux@example.com>',
+                'foo@example.com, Foo Bar <bar@example.com>, \n'
+                ' =?utf-8?q?F=C3=B4o_Baz?= <baz@example.com>, '
+                '"Quux, Foo" <quux@example.com>',
+            ),
+            # Long local part forces line wrap
+            (
+                '01234567890123456789012345678901234567890123456789012345678901@example.org, '
+                '\u00e4 <foo@example.org>',
+                '01234567890123456789012345678901234567890123456789012345678901@example.org, \n'
+                ' =?utf-8?q?=C3=A4?= <foo@example.org>',
+            ),
+            # cpython#100900 — Unicode name with RFC 5322 specials
+            (
+                'foo@example.com, Foo Bar <bar@example.com>, '
+                'F\u00f4o Baz <baz@example.com>, "Qu\u00fbx, Foo" <quux@example.com>',
+                'foo@example.com, Foo Bar <bar@example.com>, \n'
+                ' =?utf-8?q?F=C3=B4o_Baz?= <baz@example.com>, \n'
+                ' =?utf-8?q?Qu=C3=BBx=2C_Foo?= <quux@example.com>',
+            ),
+        ],
+    )
     def test_address_header(self, hval: str, verify: str) -> None:
         wrapped = wrap_header(('To', hval))
         assert wrapped.decode() == f'To: {verify}'
 
-    @pytest.mark.parametrize('hval,verify', [
-        # Short message-id
-        ('<20240319-short-message-id@example.com>',
-         '<20240319-short-message-id@example.com>'),
-        # Long message-id — unbreakable, stays on one line
-        ('<20240319-very-long-message-id-that-spans-multiple-lines-for-sure'
-         '-because-longer-than-75-characters-abcde123456@longdomain.example.com>',
-         '<20240319-very-long-message-id-that-spans-multiple-lines-for-sure'
-         '-because-longer-than-75-characters-abcde123456@longdomain.example.com>'),
-    ])
+    @pytest.mark.parametrize(
+        'hval,verify',
+        [
+            # Short message-id
+            (
+                '<20240319-short-message-id@example.com>',
+                '<20240319-short-message-id@example.com>',
+            ),
+            # Long message-id — unbreakable, stays on one line
+            (
+                '<20240319-very-long-message-id-that-spans-multiple-lines-for-sure'
+                '-because-longer-than-75-characters-abcde123456@longdomain.example.com>',
+                '<20240319-very-long-message-id-that-spans-multiple-lines-for-sure'
+                '-because-longer-than-75-characters-abcde123456@longdomain.example.com>',
+            ),
+        ],
+    )
     def test_message_id(self, hval: str, verify: str) -> None:
         wrapped = wrap_header(('Message-ID', hval))
         assert wrapped.decode() == f'Message-ID: {verify}'
@@ -203,8 +267,9 @@ class TestMinimizeThread:
 
     def test_custom_keep_headers(self, make_msg: MsgFactory) -> None:
         """Callers can override which headers to keep."""
-        msg = make_msg(subject='Test', body='Hello.\n',
-                              date='Mon, 01 Jan 2024 00:00:00 +0000')
+        msg = make_msg(
+            subject='Test', body='Hello.\n', date='Mon, 01 Jan 2024 00:00:00 +0000'
+        )
         result = minimize_thread([msg], keep_headers=('Subject',))
         assert len(result) == 1
         assert result[0]['Subject'] == 'Test'
@@ -329,15 +394,11 @@ class TestMinimizeThread:
         assert 'Second paragraph' not in text
         assert 'My reply here.' in text
 
-    def test_reduce_quote_context_short_quote_untouched(self, make_msg: MsgFactory) -> None:
+    def test_reduce_quote_context_short_quote_untouched(
+        self, make_msg: MsgFactory
+    ) -> None:
         """Quotes with 5 or fewer skippable lines are left alone."""
-        body = (
-            '> Line one.\n'
-            '> Line two.\n'
-            '>\n'
-            '> Last para.\n'
-            'Reply.\n'
-        )
+        body = '> Line one.\n> Line two.\n>\n> Last para.\nReply.\n'
         msg = make_msg(body=body)
         result = minimize_thread([msg], reduce_quote_context=True)
         text = result[0].get_payload()
diff --git a/tests/test_mbox.py b/tests/test_mbox.py
index 9bc2271..7269192 100644
--- a/tests/test_mbox.py
+++ b/tests/test_mbox.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Tests for liblore.mbox."""
+
 from __future__ import annotations
 
 import textwrap
@@ -176,6 +177,7 @@ class TestSplitMboxAsBytes:
     def test_roundtrip_with_split_mbox(self, sample_mbox: bytes) -> None:
         """split_mbox_as_bytes + parse_message should match split_mbox."""
         from liblore.utils import parse_message
+
         raw_chunks = split_mbox_as_bytes(sample_mbox)
         parsed = split_mbox(sample_mbox)
         assert len(raw_chunks) == len(parsed)
@@ -265,6 +267,7 @@ class TestSplitAndDedupeAsBytes:
     def test_roundtrip_with_split_and_dedupe(self, sample_mbox: bytes) -> None:
         """Parsing the bytes output should match split_and_dedupe."""
         from liblore.utils import parse_message
+
         doubled = sample_mbox + sample_mbox
         chunks = split_and_dedupe_as_bytes(doubled)
         msgs = split_and_dedupe(doubled)
diff --git a/tests/test_message.py b/tests/test_message.py
index 947e112..77c4cd4 100644
--- a/tests/test_message.py
+++ b/tests/test_message.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Tests for liblore.message."""
+
 from __future__ import annotations
 
 from email.message import EmailMessage
diff --git a/tests/test_node.py b/tests/test_node.py
index 54d76d8..8f4ccac 100644
--- a/tests/test_node.py
+++ b/tests/test_node.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Tests for liblore.node (LoreNode)."""
+
 from __future__ import annotations
 
 import gzip
@@ -18,6 +19,7 @@ from liblore.node import LoreNode
 # Session management
 # =====================================================================
 
+
 class TestSessionManagement:
     def test_creates_session(self) -> None:
         node = LoreNode()
@@ -115,6 +117,7 @@ class TestSessionManagement:
 # get_mbox_by_msgid / get_mbox_by_query
 # =====================================================================
 
+
 class TestGetMboxByMsgid:
     def test_returns_raw_bytes(self, sample_mbox: bytes) -> None:
         node = LoreNode('https://lore.kernel.org/all')
@@ -243,6 +246,7 @@ class TestGetMboxByQuery:
 # get_thread_by_msgid
 # =====================================================================
 
+
 class TestGetThreadByMsgid:
     def test_full_thread(self, sample_mbox: bytes) -> None:
         node = LoreNode('https://lore.kernel.org/all')
@@ -315,6 +319,7 @@ class TestGetThreadByMsgid:
 # get_thread_updates_since
 # =====================================================================
 
+
 class TestGetThreadUpdatesSince:
     def test_returns_messages(self, sample_mbox: bytes) -> None:
         node = LoreNode('https://lore.kernel.org/all')
@@ -370,7 +375,9 @@ class TestGetThreadUpdatesSince:
 
         since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
         msgs = node.get_thread_updates_since(
-            'first@example.com', since, sort=True,
+            'first@example.com',
+            since,
+            sort=True,
         )
         assert len(msgs) >= 1
 
@@ -391,6 +398,7 @@ class TestGetThreadUpdatesSince:
 # get_thread_by_query
 # =====================================================================
 
+
 class TestGetThreadByQuery:
     def test_posts_query(self, sample_mbox: bytes) -> None:
         node = LoreNode('https://lore.kernel.org/all')
@@ -423,6 +431,7 @@ class TestGetThreadByQuery:
 # get_message_by_msgid
 # =====================================================================
 
+
 class TestGetMessageByMsgid:
     def test_fetches_raw(self) -> None:
         node = LoreNode('https://lore.kernel.org/all')
@@ -451,6 +460,7 @@ class TestGetMessageByMsgid:
 # batch_get_thread_by_msgid
 # =====================================================================
 
+
 class TestBatchGetThreadByMsgid:
     def test_returns_ordered_results(self) -> None:
         node = LoreNode()
@@ -482,11 +492,17 @@ class TestBatchGetThreadByMsgid:
 
         with patch('liblore.node.time.sleep'):
             node.batch_get_thread_by_msgid(
-                ['a@x'], strict=False, sort=True, since='20240101',
+                ['a@x'],
+                strict=False,
+                sort=True,
+                since='20240101',
             )
 
         node.get_thread_by_msgid.assert_called_once_with(
-            'a@x', strict=False, sort=True, since='20240101',
+            'a@x',
+            strict=False,
+            sort=True,
+            since='20240101',
         )
 
     def test_sleep_count_matches_gaps(self) -> None:
@@ -514,6 +530,7 @@ class TestBatchGetThreadByMsgid:
 # batch_get_thread_by_query
 # =====================================================================
 
+
 class TestBatchGetThreadByQuery:
     def test_returns_ordered_results(self) -> None:
         node = LoreNode()
@@ -564,6 +581,7 @@ class TestBatchGetThreadByQuery:
 # validate
 # =====================================================================
 
+
 class TestValidate:
     def test_valid_url(self) -> None:
         node = LoreNode('https://lore.kernel.org/lkml')
@@ -603,6 +621,7 @@ class TestValidate:
 # URL fallback
 # =====================================================================
 
+
 class TestFallback:
     """Tests for the fallback_urls feature."""
 
@@ -807,6 +826,7 @@ class TestFallback:
     def test_invalid_fallback_url_no_scheme(self) -> None:
         """Fallback URL without scheme raises LibloreError."""
         from liblore import LibloreError
+
         with pytest.raises(LibloreError, match='Invalid fallback URL'):
             LoreNode(
                 'https://lore.kernel.org/all',
@@ -816,6 +836,7 @@ class TestFallback:
     def test_invalid_fallback_url_with_path(self) -> None:
         """Fallback URL with a path component raises LibloreError."""
         from liblore import LibloreError
+
         with pytest.raises(LibloreError, match='must be a scheme://host origin'):
             LoreNode(
                 'https://lore.kernel.org/all',
@@ -863,6 +884,7 @@ class TestFallback:
 # Origin probing
 # =====================================================================
 
+
 class TestProbeOrigins:
     """Tests for the probe_origins() fastest-mirror feature."""
 
@@ -998,7 +1020,8 @@ class TestProbeOrigins:
             assert h['User-Agent'] == 'myapp/1.0'
 
     def test_auto_probe_triggers_on_first_request(
-        self, sample_mbox: bytes,
+        self,
+        sample_mbox: bytes,
     ) -> None:
         """With auto_probe=True, first _request() triggers probe."""
         node = LoreNode(
@@ -1038,6 +1061,7 @@ class TestProbeOrigins:
         node.set_requests_session(mock_session)
 
         probe_count = 0
+
         def fake_head(url: str, **kwargs: object) -> MagicMock:
             nonlocal probe_count
             probe_count += 1
@@ -1105,10 +1129,12 @@ class TestProbeOrigins:
 
         # Backdate cache file to force expiry
         import glob as glob_mod
+
         for f in glob_mod.glob(os.path.join(cache_dir, '*.lore.cache')):
             os.utime(f, (0, 0))
 
         probe_called = False
+
         def fake_head_2(url: str, **kwargs: object) -> MagicMock:
             nonlocal probe_called
             probe_called = True
@@ -1123,7 +1149,8 @@ class TestProbeOrigins:
         assert probe_called
 
     def test_probe_cache_ignored_when_origins_change(
-        self, tmp_path: object,
+        self,
+        tmp_path: object,
     ) -> None:
         """Cache is ignored when the set of origins differs."""
         cache_dir = str(tmp_path)
@@ -1149,6 +1176,7 @@ class TestProbeOrigins:
         )
 
         probe_called = False
+
         def fake_head_2(url: str, **kwargs: object) -> MagicMock:
             nonlocal probe_called
             probe_called = True
@@ -1207,6 +1235,7 @@ class TestProbeOrigins:
 # Git config integration
 # =====================================================================
 
+
 class TestFromGitConfig:
     """Tests for LoreNode.from_git_config() with legacy [lore] section.
 
@@ -1226,8 +1255,10 @@ class TestFromGitConfig:
             'probettl': '7200',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value=gitcfg):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value=gitcfg),
+        ):
             node = LoreNode.from_git_config()
 
         assert node._all_origins == [
@@ -1246,8 +1277,10 @@ class TestFromGitConfig:
             'autoprobe': 'true',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value=gitcfg):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value=gitcfg),
+        ):
             node = LoreNode.from_git_config(
                 fallback_urls=['https://explicit.example.com'],
                 auto_probe=False,
@@ -1261,16 +1294,20 @@ class TestFromGitConfig:
 
     def test_git_not_installed(self) -> None:
         """Works fine when both config helpers return empty."""
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value={}):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value={}),
+        ):
             node = LoreNode.from_git_config()
 
         assert node._all_origins == ['https://lore.kernel.org']
 
     def test_no_config_keys(self) -> None:
         """Works fine when no lore.* keys exist in git config."""
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value={}):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value={}),
+        ):
             node = LoreNode.from_git_config()
 
         assert node._all_origins == ['https://lore.kernel.org']
@@ -1280,16 +1317,20 @@ class TestFromGitConfig:
         """Non-numeric lore.probetimeout is silently ignored."""
         gitcfg: dict[str, str | list[str]] = {'probetimeout': 'notanumber'}
 
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value=gitcfg):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value=gitcfg),
+        ):
             node = LoreNode.from_git_config()
 
         assert node._probe_timeout == 5.0  # default
 
     def test_custom_url_passed_through(self) -> None:
         """The url argument is forwarded to __init__."""
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value={}):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value={}),
+        ):
             node = LoreNode.from_git_config(
                 url='https://my-inbox.example.com/lists',
             )
@@ -1302,8 +1343,10 @@ class TestFromGitConfig:
             'useragentplus': '550e8400-e29b-41d4',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value=gitcfg):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value=gitcfg),
+        ):
             node = LoreNode.from_git_config()
 
         assert node._user_agent_plus == '550e8400-e29b-41d4'
@@ -1317,8 +1360,10 @@ class TestFromGitConfig:
             'useragentplus': 'from-git-config',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value=gitcfg):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value=gitcfg),
+        ):
             node = LoreNode.from_git_config()
 
         node.set_user_agent('myapp', '1.0', plus='explicit')
@@ -1336,8 +1381,10 @@ class TestFromGitConfig:
             'useragentplus': 'myuuid',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value=gitcfg):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value=gitcfg),
+        ):
             node = LoreNode.from_git_config()
 
         node.set_user_agent('bugspray', '0.3')
@@ -1426,7 +1473,9 @@ class TestGetSubsectionConfig:
         )
         with patch('liblore.node.subprocess.run', return_value=mock_result):
             cfg = _get_subsection_config(
-                'liblore', 'https://lore.kernel.org', multivals=['fallback'],
+                'liblore',
+                'https://lore.kernel.org',
+                multivals=['fallback'],
             )
 
         assert cfg == {
@@ -1444,12 +1493,12 @@ class TestGetSubsectionConfig:
 
         mock_result = MagicMock()
         mock_result.returncode = 0
-        mock_result.stdout = (
-            'liblore.https://subspace.kernel.org.fallback\nhttps://mirror.example.com\x00'
-        )
+        mock_result.stdout = 'liblore.https://subspace.kernel.org.fallback\nhttps://mirror.example.com\x00'
         with patch('liblore.node.subprocess.run', return_value=mock_result):
             cfg = _get_subsection_config(
-                'liblore', 'https://subspace.kernel.org', multivals=['fallback'],
+                'liblore',
+                'https://subspace.kernel.org',
+                multivals=['fallback'],
             )
 
         assert cfg == {
@@ -1465,7 +1514,8 @@ class TestGetSubsectionConfig:
         mock_result.stdout = ''
         with patch('liblore.node.subprocess.run', return_value=mock_result):
             cfg = _get_subsection_config(
-                'liblore', 'https://nonexistent.example.com',
+                'liblore',
+                'https://nonexistent.example.com',
             )
 
         assert cfg == {}
@@ -1479,7 +1529,8 @@ class TestGetSubsectionConfig:
             side_effect=FileNotFoundError('git not found'),
         ):
             cfg = _get_subsection_config(
-                'liblore', 'https://lore.kernel.org',
+                'liblore',
+                'https://lore.kernel.org',
             )
 
         assert cfg == {}
@@ -1496,8 +1547,10 @@ class TestFromGitConfigSubsections:
             'useragentplus': 'subsection-uuid',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value=subsection_cfg), \
-             patch('liblore.node._get_config_from_git', return_value={}) as mock_legacy:
+        with (
+            patch('liblore.node._get_subsection_config', return_value=subsection_cfg),
+            patch('liblore.node._get_config_from_git', return_value={}) as mock_legacy,
+        ):
             node = LoreNode.from_git_config()
 
         assert node._all_origins == [
@@ -1516,8 +1569,10 @@ class TestFromGitConfigSubsections:
             'autoprobe': 'true',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value=legacy_cfg):
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch('liblore.node._get_config_from_git', return_value=legacy_cfg),
+        ):
             node = LoreNode.from_git_config()
 
         assert node._all_origins == [
@@ -1533,8 +1588,12 @@ class TestFromGitConfigSubsections:
             'autoprobe': 'true',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value={}), \
-             patch('liblore.node._get_config_from_git', return_value=legacy_cfg) as mock_legacy:
+        with (
+            patch('liblore.node._get_subsection_config', return_value={}),
+            patch(
+                'liblore.node._get_config_from_git', return_value=legacy_cfg
+            ) as mock_legacy,
+        ):
             node = LoreNode.from_git_config(
                 url='https://subspace.kernel.org/_lists/helpdesk',
             )
@@ -1552,8 +1611,10 @@ class TestFromGitConfigSubsections:
             'useragentplus': 'subspace-token',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value=subsection_cfg), \
-             patch('liblore.node._get_config_from_git') as mock_legacy:
+        with (
+            patch('liblore.node._get_subsection_config', return_value=subsection_cfg),
+            patch('liblore.node._get_config_from_git') as mock_legacy,
+        ):
             node = LoreNode.from_git_config(
                 url='https://subspace.kernel.org/_lists/helpdesk',
             )
@@ -1576,8 +1637,12 @@ class TestFromGitConfigSubsections:
             'useragentplus': 'old-uuid',
         }
 
-        with patch('liblore.node._get_subsection_config', return_value=subsection_cfg), \
-             patch('liblore.node._get_config_from_git', return_value=legacy_cfg) as mock_legacy:
+        with (
+            patch('liblore.node._get_subsection_config', return_value=subsection_cfg),
+            patch(
+                'liblore.node._get_config_from_git', return_value=legacy_cfg
+            ) as mock_legacy,
+        ):
             node = LoreNode.from_git_config()
 
         # Subsection wins
@@ -1613,6 +1678,7 @@ class TestFromGitConfigSubsections:
 # Public API: request()
 # =====================================================================
 
+
 class TestRequest:
     """Tests for the public request() method."""
 
@@ -1670,7 +1736,8 @@ class TestRequest:
         node.set_requests_session(mock_session)
 
         node.request(
-            'GET', 'https://lore.kernel.org/manifest.js.gz',
+            'GET',
+            'https://lore.kernel.org/manifest.js.gz',
             timeout=30,
         )
         _, kwargs = mock_session.get.call_args
@@ -1681,6 +1748,7 @@ class TestRequest:
 # Public API: user_agent_plus property
 # =====================================================================
 
+
 class TestUserAgentPlusProperty:
     """Tests for the user_agent_plus read-only property."""
 
@@ -1710,6 +1778,7 @@ class TestUserAgentPlusProperty:
 # Public API: origins property
 # =====================================================================
 
+
 class TestOriginsProperty:
     """Tests for the origins read-only property."""
 
@@ -1763,6 +1832,7 @@ class TestOriginsProperty:
 # Public API: canonical_origin property
 # =====================================================================
 
+
 class TestCanonicalOriginProperty:
     """Tests for the canonical_origin read-only property."""
 
diff --git a/tests/test_thread.py b/tests/test_thread.py
index 62a9a1e..d835373 100644
--- a/tests/test_thread.py
+++ b/tests/test_thread.py
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Tests for liblore.thread."""
+
 from __future__ import annotations
 
 from conftest import MsgFactory
diff --git a/tools/b4-ci-check.py b/tools/b4-ci-check.py
index 1bc5de1..563e018 100644
--- a/tools/b4-ci-check.py
+++ b/tools/b4-ci-check.py
@@ -51,6 +51,12 @@ def main() -> None:
     repo_root = Path(__file__).resolve().parent.parent
     os.chdir(repo_root)
     checks = [
+        Check(
+            tool='ruff format',
+            args=['format', '--check'],
+            pass_summary='ruff format passed',
+            run=run_subprocess('ruff'),
+        ),
         Check(
             tool='ruff lint',
             args=['check'],

-- 
2.53.0


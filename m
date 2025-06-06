Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB33323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239487; cv=none; b=ZPvTlAi8wqcJteVLQpRURyX4A0IYnXnovdTNg2shT71JmRUKItQ5jHGnwXPnj4TCmWQ2m75YxW8CbFQf5/0u0HhS8RAom3TKG9iu1gZAzzIzXnsQmbEeovdrQ1u+9+w/XzzxKn+PAfmVPwMaOXMyYg6MytnsYs6rdO6BAKcc36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239487; c=relaxed/simple;
	bh=DghGyEdI8xmgFy20i4siI8g67khy7PpgkOzC5FITHdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrhPWerypeMPovFq7dnTTnj8nCLJ3+oIOH2fULvSAF2LGw+dwrnv0Nij16LBAEwV5NFZr98wliuC+quM2qfRjhFB8UvJELJsJn234iOMRH2VI+VMolqngpN9cxs89ioM9oFCky7KDO/FI3rRUAPWWsy+y+RzP1au/e9e3Yf9rpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cU+g4JjX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cU+g4JjX"
Received: by smtp.kernel.org (Postfix)
	id 22608C4AF0C; Fri,  6 Jun 2025 19:51:27 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70577C4CEEF
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70577C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476a720e806so21604521cf.0
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239482; x=1749844282; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4gszA6DHwl9HrvRWJpTL45J3Cm+fVGU67SXXDTeJdg=;
        b=cU+g4JjXLTFJlecJ7RSHpxD/Mz2VR98I/VnZ2HDvcAoXwkIbdc9Vn77im4Kq0vtofW
         HLXy5D9xjqKnHkuW8m/1mke+hFFVIGH/zZy91V+uk73fshTRS2PyvCVAMWIaF1CHbDg2
         NVTZEgDdxjpaxAzS4SL4+6NzXnSgSguMx0q0c0w29N/N9jnBtkqXakFCX3XysgcTUmSM
         KrNAw3D9SpgreyUcO4Z5ivKaWqb8bh9XJ4KFKKUXFo/h41c6wg84407zh5hybZz3E0oI
         WoM8gBjRpMhCl+7/lwJkcokjwrhXwE87/HTS6lIrNr49SsLtSYG+o8wxtvw/HV+ewvpm
         jKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239482; x=1749844282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4gszA6DHwl9HrvRWJpTL45J3Cm+fVGU67SXXDTeJdg=;
        b=uhQqtDKCGgYp+qnuIncMT/M8txA84vytTfzRywZpR+RQWMoE1tNNcUDfRmLf3XjtI1
         02+YnOOzooSbjCxNsKhiltlSUsQStGpCT80PUoy0atOjSILT7R1JI39bhPXpPUa3Jn5y
         oToYxsenAip0HodV0rczNxozP0E1Rs2cV+aoFWjR0RJ8kbqTEZOnfL0TASFIQvPuq20c
         Vl4xd+IcUE2HGQhjtlx1A+9lY5y4+1SJgvLZwAJ2Sfbt570BL9cB/SfyI3S2ShFWGfzu
         PL+OISCXo6QpXbF468YCkcMz2/xI5UksBlp0lLAbrWhqQKcMBXOEwP0LNuAc5h6s1/Ha
         1Mhw==
X-Gm-Message-State: AOJu0YzrwrIQ25DJLPI4XsXmmaP/uWlMT65J8f2IBpovLSbvzz4y7VJn
	nlAZR5E73siYjbRFExuOPfdA/ocQywzbSxAXa6zxMmNAZT7oHJpiKObo
X-Gm-Gg: ASbGncvFL4IIbNX0e9YOP+hHNsBl+cTyxU5C+P1+tVeVFbcN8dA388I1T+olZ94Yn0n
	lytrBa7sdB7y2jMoouIoe/HOaDNadNqkQIg15JeoL51wx/VJzuPPWdu31XEl5GsxAt7KH3HCoLp
	SVh9rQ8Q0aSLYHPkGcFec11kI/JTi7dVs5cdeGd548Bf/oMi8xFmECC8tDKFZNxkNo5UIkbzYas
	POO9tYxlspMsJzw/1gjOAGWQtEz+qsG0NT21yzZHu7NmoYAgV2QDoWmHu8faZSFXufqNwuSc1f0
	4ANYu93Zfl0EtSV2OGDo3D3LIYlV7if+RSMjHpMya3/DlFcWJDExfVvm6HZPupKbOtaWQP54y9t
	RfJ6NvZjx
X-Google-Smtp-Source: AGHT+IGpPXOtoqWmrUnUPcjvubihMJJ6sZBG/gTN26afprk//1xKye6Iq56ZBDe4m0wB22Si/rveGw==
X-Received: by 2002:a05:622a:1f99:b0:494:adff:7fe2 with SMTP id d75a77b69052e-4a5b9da2facmr79122271cf.43.1749239481811;
        Fri, 06 Jun 2025 12:51:21 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:20 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:15 -0400
Subject: [PATCH b4 04/10] Add ruff, remove all noqa comments
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-4-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Allows `ruff check` to pass.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 misc/send-receive.py       |  6 +++---
 pyproject.toml             |  7 +++++++
 src/b4/__init__.py         |  8 ++++----
 src/b4/ez.py               | 14 +++++++-------
 src/b4/mbox.py             |  4 ++--
 src/b4/ty.py               |  4 ++--
 src/tests/conftest.py      |  2 +-
 src/tests/test___init__.py |  6 +++---
 src/tests/test_ez.py       |  3 +--
 src/tests/test_mbox.py     |  3 +--
 10 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/misc/send-receive.py b/misc/send-receive.py
index edbbb07..d9cd339 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -84,7 +84,7 @@ class SendReceiveListener(object):
         conn.execute(q)
         conn.close()
 
-    def on_get(self, req, resp):  # noqa
+    def on_get(self, req, resp):
         resp.status = falcon.HTTP_200
         resp.content_type = falcon.MEDIA_TEXT
         resp.text = "We don't serve GETs here\n"
@@ -417,7 +417,7 @@ class SendReceiveListener(object):
             bdata = umsg.encode()
             try:
                 identity, selector, auth_id = self.validate_message(conn, t_auth, bdata)
-            except patatt.NoKeyError as ex:  # noqa
+            except patatt.NoKeyError:
                 self.send_error(resp, message='No matching key, please complete web auth first.')
                 return
             except Exception as ex:
@@ -623,7 +623,7 @@ class SendReceiveListener(object):
         raw = req.bounded_stream.read()
         try:
             jdata = json.loads(raw)
-        except:
+        except Exception:
             resp.status = falcon.HTTP_500
             resp.content_type = falcon.MEDIA_TEXT
             resp.text = 'Failed to parse the request\n'
diff --git a/pyproject.toml b/pyproject.toml
index 7264a9d..d2eaa54 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -33,6 +33,7 @@ dependencies = [
 dev = [
     "pip-tools",
     "pytest",
+    "ruff",
     "types-requests",
 ]
 
@@ -71,3 +72,9 @@ files = [
     {filename = "src/b4/man/b4.5.rst"},
     {filename = "src/b4/man/b4.5"},
 ]
+
+[tool.ruff.lint]
+select = [
+    "PGH004", # https://docs.astral.sh/ruff/rules/blanket-noqa/
+]
+flake8-quotes.inline-quotes = "single"
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a9d5906..2b36cb0 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1443,7 +1443,7 @@ class LoreMessage:
             try:
                 res = dkim.verify(self.msg.as_bytes(policy=emlpolicy), logger=dkimlogger)
                 logger.debug('DKIM verify results: %s=%s', identity, res)
-            except Exception as ex:  # noqa
+            except Exception as ex:
                 # Usually, this is due to some DNS resolver failure, which we can't
                 # possibly cleanly try/catch. Just mark it as failed and move on.
                 logger.debug('DKIM attestation failed: %s', ex)
@@ -2664,7 +2664,7 @@ class LoreAttestor:
             return None
         try:
             return datetime.datetime.fromtimestamp(int(ts), datetime.timezone.utc)
-        except:  # noqa
+        except Exception:
             logger.debug('Failed parsing t=%s', ts)
         return None
 
@@ -2988,7 +2988,7 @@ def _setup_main_config(cmdargs: Optional[argparse.Namespace] = None) -> None:
             resolvers = [x.strip() for x in config['attestation-dns-resolvers'].split(',')]
             if resolvers:
                 # Don't force this as an automatically discovered dependency
-                import dns.resolver  # noqa
+                import dns.resolver
                 dns.resolver.default_resolver = dns.resolver.Resolver(configure=False)
                 dns.resolver.default_resolver.nameservers = resolvers
         except ImportError:
@@ -4123,7 +4123,7 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, None], msgs: Sequence[
             rdata = res.json()
             if rdata.get('result') == 'success':
                 return len(tosend)
-        except Exception as ex:  # noqa
+        except Exception:
             logger.critical('Odd response from the endpoint: %s', res.text)
             return 0
 
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 76f0044..bf7b96c 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -40,7 +40,7 @@ except ModuleNotFoundError:
     can_patatt = False
 
 try:
-    import git_filter_repo as fr  # noqa
+    import git_filter_repo as fr
 
     can_gfr = True
 except ModuleNotFoundError:
@@ -199,7 +199,7 @@ def auth_new() -> None:
                 logger.info('Once you receive it, run b4 send --web-auth-verify [challenge-string]')
             sys.exit(0)
 
-        except Exception as ex:  # noqa
+        except Exception:
             logger.critical('Odd response from the endpoint: %s', res.text)
             sys.exit(1)
 
@@ -241,7 +241,7 @@ def auth_verify(cmdargs: argparse.Namespace) -> None:
                 logger.info('You may now use this endpoint for submitting patches.')
             sys.exit(0)
 
-        except Exception as ex:  # noqa
+        except Exception:
             logger.critical('Odd response from the endpoint: %s', res.text)
             sys.exit(1)
 
@@ -316,7 +316,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
                             break
                         cover_sections.append(section)
                     cover = '\n---\n'.join(cover_sections).strip()
-                except Exception as ex:  # noqa
+                except Exception as ex:
                     logger.critical('CRITICAL: unable to restore tracking information, ignoring')
                     logger.critical('          %s', ex)
 
@@ -771,7 +771,7 @@ class FRCommitMessageEditor:
     def add(self, commit: str, message: str):
         self.edit_map[commit.encode()] = message.encode()
 
-    def callback(self, commit, metadata):  # noqa
+    def callback(self, commit, metadata):
         if commit.original_id in self.edit_map:
             commit.message = self.edit_map[commit.original_id]
 
@@ -1224,7 +1224,7 @@ def get_addresses_from_cmd(cmdargs: List[str], msgbytes: bytes) -> List[Tuple[st
         return list()
     # Run this command from git toplevel
     topdir = b4.git_get_toplevel()
-    ecode, out, err = b4._run_command(cmdargs, stdin=msgbytes, rundir=topdir)  # noqa
+    ecode, out, err = b4._run_command(cmdargs, stdin=msgbytes, rundir=topdir)
     if ecode > 0:
         logger.critical('CRITICAL: Running %s failed:', ' '.join(cmdargs))
         logger.critical(err.decode(errors='ignore'))
@@ -2105,7 +2105,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
     else:
         try:
             smtp, fromaddr = b4.get_smtp(dryrun=cmdargs.dryrun)
-        except Exception as ex:  # noqa
+        except Exception as ex:
             logger.critical('Failed to configure the smtp connection:')
             logger.critical(ex)
             sys.exit(1)
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index a02e827..f20ba86 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -510,12 +510,12 @@ def thanks_record_am(lser: b4.LoreSeries, cherrypick: Optional[List[int]]) -> No
 
     try:
         allto = email.utils.getaddresses([str(x) for x in lmsg.msg.get_all('to', [])])
-    except Exception as ex:  # noqa
+    except Exception as ex:
         allto = []
         logger.debug('Unable to parse the To: header in %s: %s', lmsg.msgid, str(ex))
     try:
         allcc = email.utils.getaddresses([str(x) for x in lmsg.msg.get_all('cc', [])])
-    except Exception as ex:  # noqa
+    except Exception as ex:
         allcc = []
         logger.debug('Unable to parse the Cc: header in %s: %s', lmsg.msgid, str(ex))
 
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 021588f..1da325f 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -261,7 +261,7 @@ def set_branch_details(gitdir: Optional[str], branch: str, jsondata: dict, confi
             # Try to grab the last two chunks of the path
             purl = Path(binfo['url'])
             jsondata['treename'] = os.path.join(purl.parts[-2], purl.parts[-1])
-        except:
+        except Exception:
             # Something went wrong... just use the whole URL
             jsondata['treename'] = binfo['url']
     else:
@@ -400,7 +400,7 @@ def send_messages(listing: List[Dict], branch: str, cmdargs: argparse.Namespace)
         send_email = True
         try:
             smtp, fromaddr = b4.get_smtp()
-        except Exception as ex:  # noqa
+        except Exception as ex:
             logger.critical('Failed to configure the smtp connection:')
             logger.critical(ex)
             sys.exit(1)
diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index d2f68d8..796bf75 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -1,4 +1,4 @@
-import pytest  # noqa
+import pytest
 import b4
 import os
 import sys
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 110bd18..1e95263 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1,4 +1,4 @@
-import pytest  # noqa
+import pytest
 import b4
 import os
 import email
@@ -183,8 +183,8 @@ def test_followup_trailers(sampledir, source, serargs, amargs, reference, b4cfg)
     # Test short message-id
     ('Message-ID: <20240319-short-message-id@example.com>', '<20240319-short-message-id@example.com>', 'encode'),
     # Test long message-id
-    ('Message-ID: <20240319-very-long-message-id-that-spans-multiple-lines-for-sure-because-longer-than-75-characters-abcde123456@longdomain.example.com>',  # noqa
-     '<20240319-very-long-message-id-that-spans-multiple-lines-for-sure-because-longer-than-75-characters-abcde123456@longdomain.example.com>',  # noqa
+    ('Message-ID: <20240319-very-long-message-id-that-spans-multiple-lines-for-sure-because-longer-than-75-characters-abcde123456@longdomain.example.com>',
+     '<20240319-very-long-message-id-that-spans-multiple-lines-for-sure-because-longer-than-75-characters-abcde123456@longdomain.example.com>',
      'encode'),
 ])
 def test_header_wrapping(sampledir, hval, verify, tr):
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 7351f79..1de2459 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -1,4 +1,4 @@
-import pytest  # noqa
+import pytest
 import os
 import b4
 import b4.ez
@@ -61,7 +61,6 @@ def test_trailers(sampledir, prepdir, mboxf, bundlef, rep, trargs, compareargs,
         cmdargs = parser.parse_args(b4args)
         with pytest.raises(SystemExit) as e:
             b4.mbox.main(cmdargs)
-            assert e.type == SystemExit
             assert e.value.code == 0
 
     cfile = os.path.join(sampledir, f'{compareout}.verify')
diff --git a/src/tests/test_mbox.py b/src/tests/test_mbox.py
index 1065f0e..dc41712 100644
--- a/src/tests/test_mbox.py
+++ b/src/tests/test_mbox.py
@@ -1,4 +1,4 @@
-import pytest  # noqa
+import pytest
 import os
 import b4
 import b4.mbox
@@ -24,7 +24,6 @@ def test_shazam(sampledir, gitdir, mboxf, shazamargs, compareargs, compareout, b
     cmdargs = parser.parse_args(shazamargs)
     with pytest.raises(SystemExit) as e:
         b4.mbox.main(cmdargs)
-        assert e.type == SystemExit
         assert e.value.code == 0
     out, logstr = b4.git_run_command(None, compareargs)
     assert out == 0

-- 
2.49.0


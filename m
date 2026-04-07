Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC4F35B645
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580525; cv=none; b=FRvYbLLFUZ1rIG6PzKyz2ZVwSqJT04+riMnqkjAEAmUjB2R0Y/4peWxdO1srgvXYoqDXzqWayEe+izmeN9IOlnR0obranvkdhXIUvwpFMyj3i4W0cseB7DPS/rs8qL0NPvMH2+6I/caAQvNaLMqAizx707OSWO9XoSoptGO0TrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580525; c=relaxed/simple;
	bh=7U3hCcuYgulxDEE0esNFa3Sz/f9HmAV2PMl+hr0kAJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6V5SO4bL5VpcjRAggaXnZlQ/eHvxKQkf2IpYG13C5OUwX+eTvX77JWUsJFnMIIV+Fu8qosCqUTuyWtzcTSfQqPhPScW86QB1GWyxaF30xvnV7fXsvfEy4t+E8CeM0LshQp/Kkjto6OOf2m11TpVeHozQSBfpqLCf++JhZyulSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5AfbrTY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5AfbrTY"
Received: by smtp.kernel.org (Postfix)
	id 2580EC19424; Tue,  7 Apr 2026 16:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89A7C116C6;
	Tue,  7 Apr 2026 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580525;
	bh=7U3hCcuYgulxDEE0esNFa3Sz/f9HmAV2PMl+hr0kAJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U5AfbrTYWstVcV+cjNC34fH7PYcQPA2BTHG9tLftttUVmh75N6zq8nRx8KpP6lckQ
	 1LPg9VAt1yd2+gb0LHu5b6zb7IagVCwiLOdpFxGgln89lTmOEIi50LbpsGXyL9G5et
	 jgEF2Y3PjytKbwD0py+OOMOgko6kuZRWYKDuJ3FIIrBoGUdmmeipWy9NqDTr9PDLNh
	 LL/d5xSDZF0ChQAdHiURCXdYH4bp3UGRbYgts2tmBX2wpseFB2bHiP2qzcgZa7tyap
	 aq2bBC7HiKh76CTSq6x1SPpFAI6PvdOU7qc+cJpRnT2F/OJl1l9jbXtLBRQlCzI5Tz
	 0CczddlGgeZ+g==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:35 -0400
Subject: [PATCH b4 06/12] Fix typings in misc/
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-6-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=21650; i=tamird@kernel.org;
 h=from:subject:message-id; bh=7U3hCcuYgulxDEE0esNFa3Sz/f9HmAV2PMl+hr0kAJw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTTPiqvV7p/5wP3Lvzd23hx64fF78kGt+vsAnsUKhl
 rNPnwvN65jIwiDGxWAppsiSKHpob3rq7T2yme+Ow8xhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6BjrGDFycAjDV16MY/ruEZXzY/ucI65d9ut3vHtepdnAGWS/X2c0ooz0tIILVLZ6RYeHCZVG
 +tkJ5i8IrzA2nxDyRLI4U0//wW3ytM3OC2BIedgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This allows mypy to run over the whole repo.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 misc/retrieve_lore_thread.py |  15 ++-
 misc/send-receive.py         | 214 +++++++++++++++++++++++++++++--------------
 pyproject.toml               |   7 ++
 3 files changed, 162 insertions(+), 74 deletions(-)

diff --git a/misc/retrieve_lore_thread.py b/misc/retrieve_lore_thread.py
index 4de39fb..3e9a54c 100644
--- a/misc/retrieve_lore_thread.py
+++ b/misc/retrieve_lore_thread.py
@@ -1,7 +1,14 @@
 import sys
+from typing import TYPE_CHECKING
 
-from instructor import OpenAISchema
-from pydantic import Field
+from pydantic import BaseModel, Field
+
+# TODO(https://github.com/567-labs/instructor/pull/2246): remove this once the
+# PR is merged and released.
+if TYPE_CHECKING:
+    OpenAISchema = BaseModel
+else:
+    from instructor import OpenAISchema
 
 # This is needed for now while the minimization bits aren't released
 sys.path.insert(0, '/home/user/work/git/korg/b4/src')
@@ -16,8 +23,8 @@ class Function(OpenAISchema):
 
     message_id: str = Field(
         ...,
-        example='20240228-foo-bar-baz@localhost',
-        descriptions='Message-ID of the thread to retrieve from lore.kernel.org',
+        examples=['20240228-foo-bar-baz@localhost'],
+        description='Message-ID of the thread to retrieve from lore.kernel.org',
     )
 
     class Config:
diff --git a/misc/send-receive.py b/misc/send-receive.py
index 35c5e99..f9f65af 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -16,11 +16,13 @@ import textwrap
 from configparser import ConfigParser, ExtendedInterpolation
 from email import charset, utils
 from string import Template
-from typing import List, Tuple, Union
+from typing import List, Mapping, Optional, Sequence, Tuple, Union
 
 import ezpi
 import falcon
 import sqlalchemy as sa
+from sqlalchemy.engine import Connection, Engine
+from sqlalchemy.sql import tuple_
 
 import patatt
 
@@ -34,10 +36,11 @@ DB_VERSION = 1
 logger = logging.getLogger('b4-send-receive')
 logger.setLevel(logging.DEBUG)
 
+JSON = Union[str, int, float, bool, Sequence['JSON'], Mapping[str, 'JSON']]
 
 class SendReceiveListener(object):
 
-    def __init__(self, _engine, _config) -> None:
+    def __init__(self, _engine: Engine, _config: ConfigParser) -> None:
         self._engine = _engine
         self._config = _config
         # You shouldn't use this in production
@@ -83,25 +86,25 @@ class SendReceiveListener(object):
         conn.execute(q)
         conn.close()
 
-    def on_get(self, req, resp):
+    def on_get(self, req: falcon.Request, resp: falcon.Response) -> None:
         resp.status = falcon.HTTP_200
         resp.content_type = falcon.MEDIA_TEXT
         resp.text = "We don't serve GETs here\n"
 
-    def send_error(self, resp, message: str) -> None:
+    def send_error(self, resp: falcon.Response, message: str) -> None:
         resp.status = falcon.HTTP_500
         logger.critical('Returning error: %s', message)
         resp.text = json.dumps({'result': 'error', 'message': message})
 
-    def send_success(self, resp, message: str) -> None:
+    def send_success(self, resp: falcon.Response, message: str) -> None:
         resp.status = falcon.HTTP_200
         logger.debug('Returning success: %s', message)
         resp.text = json.dumps({'result': 'success', 'message': message})
 
-    def get_smtp(self) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, None], Tuple[str, str]]:
+    def get_smtp(self) -> Tuple[smtplib.SMTP, Tuple[str, str]]:
         sconfig = self._config['sendemail']
         server = sconfig.get('smtpserver', 'localhost')
-        port = sconfig.get('smtpserverport', 0)
+        port = sconfig.getint('smtpserverport', 0)
         encryption = sconfig.get('smtpencryption')
 
         logger.debug('Connecting to %s:%s', server, port)
@@ -132,34 +135,54 @@ class SendReceiveListener(object):
             # We assume you know what you're doing if you don't need encryption
             smtp = smtplib.SMTP(server, port)
 
-        frompair = utils.getaddresses([sconfig.get('from')])[0]
+        afrom = sconfig.get('from')
+        assert afrom is not None
+        frompair = utils.getaddresses([afrom])[0]
         return smtp, frompair
 
-    def auth_new(self, jdata, resp) -> None:
+    def auth_new(self, jdata: Mapping[str, JSON], resp: falcon.Response) -> None:
         # Is it already authorized?
         conn = self._engine.connect()
         md = sa.MetaData()
-        identity = jdata.get('identity')
-        selector = jdata.get('selector')
+        identity: Optional[JSON] = jdata.get('identity')
+        selector: Optional[JSON] = jdata.get('selector')
+        pubkey: Optional[JSON] = jdata.get('pubkey')
+        if (
+            not isinstance(identity, str)
+            or not isinstance(selector, str)
+            or not isinstance(pubkey, str)
+        ):
+            self.send_error(resp, message='Invalid authentication request')
+            return
         logger.info('New authentication request for %s/%s', identity, selector)
-        pubkey = jdata.get('pubkey')
         t_auth = sa.Table('auth', md, autoload=True, autoload_with=self._engine)
-        q = sa.select([t_auth.c.auth_id]).where(t_auth.c.identity == identity, t_auth.c.selector == selector,
-                                                t_auth.c.verified == 1)
-        rp = conn.execute(q)
+        select_auth = sa.select(t_auth.c.auth_id).where(
+            t_auth.c.identity == identity,
+            t_auth.c.selector == selector,
+            t_auth.c.verified == 1,
+        )
+        rp = conn.execute(select_auth)
         if len(rp.fetchall()):
             self.send_error(resp, message='i=%s;s=%s is already authorized' % (identity, selector))
             return
         # delete any existing challenges for this and create a new one
-        q = sa.delete(t_auth).where(t_auth.c.identity == identity, t_auth.c.selector == selector,
-                                    t_auth.c.verified == 0)
-        conn.execute(q)
+        delete_auth = sa.delete(t_auth).where(
+            t_auth.c.identity == identity,
+            t_auth.c.selector == selector,
+            t_auth.c.verified == 0,
+        )
+        conn.execute(delete_auth)
         # create new challenge
         import uuid
         cstr = str(uuid.uuid4())
-        q = sa.insert(t_auth).values(identity=identity, selector=selector, pubkey=pubkey, challenge=cstr,
-                                     verified=0)
-        conn.execute(q)
+        insert_auth = sa.insert(t_auth).values(
+            identity=identity,
+            selector=selector,
+            pubkey=pubkey,
+            challenge=cstr,
+            verified=0,
+        )
+        conn.execute(insert_auth)
         logger.info('Created new challenge for %s/%s: %s', identity, selector, cstr)
         conn.close()
         smtp, frompair = self.get_smtp()
@@ -192,50 +215,62 @@ class SendReceiveListener(object):
         destaddrs = [identity]
         alwaysbcc = self._config['main'].get('alwayscc')
         if alwaysbcc:
-            destaddrs += [x[1] for x in utils.getaddresses(alwaysbcc)]
+            destaddrs += [x[1] for x in utils.getaddresses([alwaysbcc])]
         logger.info('Sending challenge to %s', identity)
         smtp.sendmail(fromaddr, [identity], bdata)
         smtp.close()
         self.send_success(resp, message=f'Challenge generated and sent to {identity}')
 
-    def validate_message(self, conn, t_auth, bdata, verified=1) -> Tuple[str, str, int]:
+    def validate_message(
+        self,
+        conn: Connection,
+        t_auth: sa.Table,
+        bdata: bytes,
+        verified: int = 1,
+    ) -> Tuple[str, str, int]:
         # Returns auth_id of the matching record
         pm = patatt.PatattMessage(bdata)
         if not pm.signed:
             raise patatt.ValidationError('Message is not signed')
 
-        auth_id = identity = selector = pubkey = None
-        for ds in pm.get_sigs():
-            selector = 'default'
-            identity = ''
-            i = ds.get_field('i')
-            if i:
-                identity = i.decode()
-            s = ds.get_field('s')
-            if s:
-                selector = s.decode()
-            logger.debug('i=%s; s=%s', identity, selector)
-            q = sa.select([t_auth.c.auth_id, t_auth.c.pubkey]).where(t_auth.c.identity == identity,
-                                                                     t_auth.c.selector == selector,
-                                                                     t_auth.c.verified == verified)
-            rp = conn.execute(q)
-            res = rp.fetchall()
-            if res:
-                auth_id, pubkey = res[0]
-                break
-
-        if not auth_id:
+        identity_selector_pairs = [
+            (
+                ''
+                if (i := ds.get_field('i')) is None
+                else i.decode()
+                if isinstance(i, bytes)
+                else i,
+                'default'
+                if (s := ds.get_field('s')) is None
+                else s.decode()
+                if isinstance(s, bytes)
+                else s,
+            )
+            for ds in pm.get_sigs()
+        ]
+        logger.debug('is_pairs=%s', identity_selector_pairs)
+        q = sa.select(
+            t_auth.c.identity, t_auth.c.selector, t_auth.c.auth_id, t_auth.c.pubkey
+        ).where(
+            tuple_(t_auth.c.identity, t_auth.c.selector).in_(identity_selector_pairs),
+            t_auth.c.verified == verified,
+        )
+        rp = conn.execute(q)
+        rows = rp.fetchall()
+        if not rows:
             logger.debug('Did not find a matching identity!')
             raise patatt.NoKeyError('No match for this identity')
 
+        identity, selector, auth_id, pubkey = rows[0]
+
         logger.debug('Found matching %s/%s with auth_id=%s', identity, selector, auth_id)
         pm.validate(identity, pubkey.encode())
 
         return identity, selector, auth_id
 
-    def auth_verify(self, jdata, resp) -> None:
+    def auth_verify(self, jdata: Mapping[str, JSON], resp: falcon.Response) -> None:
         msg = jdata.get('msg')
-        if msg.find('\nverify:') < 0:
+        if not isinstance(msg, str) or msg.find('\nverify:') < 0:
             self.send_error(resp, message='Invalid verification message')
             return
         conn = self._engine.connect()
@@ -250,22 +285,28 @@ class SendReceiveListener(object):
         logger.debug('Message validation passed for %s/%s with auth_id=%s', identity, selector, auth_id)
 
         # Now compare the challenge to what we received
-        q = sa.select([t_auth.c.challenge]).where(t_auth.c.auth_id == auth_id)
-        rp = conn.execute(q)
+        select_challenge = sa.select(t_auth.c.challenge).where(
+            t_auth.c.auth_id == auth_id
+        )
+        rp = conn.execute(select_challenge)
         res = rp.fetchall()
         challenge = res[0][0]
         if msg.find(f'\nverify:{challenge}') < 0:
             self.send_error(resp, message='Challenge verification for %s/%s did not match' % (identity, selector))
             return
         logger.info('Successfully verified challenge for %s/%s with auth_id=%s', identity, selector, auth_id)
-        q = sa.update(t_auth).where(t_auth.c.auth_id == auth_id).values(challenge=None, verified=1)
-        conn.execute(q)
+        update_auth = (
+            sa.update(t_auth)
+            .where(t_auth.c.auth_id == auth_id)
+            .values(challenge=None, verified=1)
+        )
+        conn.execute(update_auth)
         conn.close()
         self.send_success(resp, message='Challenge verified for %s/%s' % (identity, selector))
 
-    def auth_delete(self, jdata, resp) -> None:
+    def auth_delete(self, jdata: Mapping[str, JSON], resp: falcon.Response) -> None:
         msg = jdata.get('msg')
-        if msg.find('\nauth-delete') < 0:
+        if not isinstance(msg, str) or msg.find('\nauth-delete') < 0:
             self.send_error(resp, message='Invalid key delete message')
             return
         conn = self._engine.connect()
@@ -279,12 +320,12 @@ class SendReceiveListener(object):
             return
 
         logger.info('Deleting record for %s/%s with auth_id=%s', identity, selector, auth_id)
-        q = sa.delete(t_auth).where(t_auth.c.auth_id == auth_id)
-        conn.execute(q)
+        delete_auth = sa.delete(t_auth).where(t_auth.c.auth_id == auth_id)
+        conn.execute(delete_auth)
         conn.close()
         self.send_success(resp, message='Record deleted for %s/%s' % (identity, selector))
 
-    def clean_header(self, hdrval: str) -> str:
+    def clean_header(self, hdrval: Optional[str]) -> str:
         if hdrval is None:
             return ''
 
@@ -325,7 +366,13 @@ class SendReceiveListener(object):
         except AttributeError:
             return all([ord(c) < 128 for c in strval])
 
-    def wrap_header(self, hdr, width: int = 75, nl: str = '\r\n', transform: str = 'preserve') -> bytes:
+    def wrap_header(
+        self,
+        hdr: Tuple[str, str],
+        width: int = 75,
+        nl: str = '\r\n',
+        transform: str = 'preserve',
+    ) -> bytes:
         hname, hval = hdr
         if hname.lower() in ('to', 'cc', 'from', 'x-original-from'):
             _parts = [f'{hname}: ']
@@ -388,11 +435,17 @@ class SendReceiveListener(object):
             bdata += self.wrap_header((hname, str(hval)), nl=nl, transform=headers) + nl.encode()
         bdata += nl.encode()
         payload = msg.get_payload(decode=True)
+        assert isinstance(payload, bytes)
         for bline in payload.split(b'\n'):
             bdata += re.sub(rb'[\r\n]*$', b'', bline) + nl.encode()
         return bdata
 
-    def receive(self, jdata, resp, reflect: bool = False) -> None:
+    def receive(
+        self,
+        jdata: Mapping[str, JSON],
+        resp: falcon.Response,
+        reflect: bool = False,
+    ) -> None:
         servicename = self._config['main'].get('myname')
         if not servicename:
             servicename = 'Web Endpoint'
@@ -400,6 +453,9 @@ class SendReceiveListener(object):
         if not umsgs:
             self.send_error(resp, message='Missing the messages array')
             return
+        if not isinstance(umsgs, Sequence):
+            self.send_error(resp, message='Invalid messages array')
+            return
         logger.debug('Received a request for %s messages', len(umsgs))
 
         diffre = re.compile(rb'^(---.*\n\+\+\+|GIT binary patch|diff --git \w/\S+ \w/\S+)', flags=re.M | re.I)
@@ -413,6 +469,9 @@ class SendReceiveListener(object):
         # First, validate all messages
         seenid = identity = selector = validfrom = None
         for umsg in umsgs:
+            if not isinstance(umsg, str):
+                self.send_error(resp, message='Invalid message payload')
+                return
             bdata = umsg.encode()
             try:
                 identity, selector, auth_id = self.validate_message(conn, t_auth, bdata)
@@ -446,6 +505,7 @@ class SendReceiveListener(object):
                     passes = False
             if passes:
                 payload = msg.get_payload(decode=True)
+                assert isinstance(payload, bytes)
                 if not (diffre.search(payload) or diffstatre.search(payload)):
                     passes = False
 
@@ -460,7 +520,9 @@ class SendReceiveListener(object):
 
             # Make sure that From: matches the validated identity. We allow + expansion,
             # such that foo+listname@example.com is allowed for foo@example.com
-            allfroms = utils.getaddresses([str(x) for x in msg.get_all('from')])
+            froms = msg.get_all('from')
+            assert froms is not None
+            allfroms = utils.getaddresses(froms)
             # Allow only a single From: address
             if len(allfroms) > 1:
                 self.send_error(resp, message='Message may only contain a single From: address.')
@@ -497,6 +559,10 @@ class SendReceiveListener(object):
             msg.add_header('X-Endpoint-Received', f'by {servicename} for {identity}/{selector} with auth_id={auth_id}')
             msgs.append((msg, destaddrs))
 
+        # Must be the case if the loop above runs at least once, and we check
+        # that umsgs is truthy (not empty).
+        assert identity is not None
+
         conn.close()
         # All signatures verified. Prepare messages for sending.
         cfgdomains = self._config['main'].get('mydomains')
@@ -511,12 +577,12 @@ class SendReceiveListener(object):
         if _bcc:
             bccaddrs.update([x[1] for x in utils.getaddresses([_bcc])])
 
-        repo = listid = None
-        if 'public-inbox' in self._config and self._config['public-inbox'].get('repo') and not reflect:
-            repo = self._config['public-inbox'].get('repo')
-            listid = self._config['public-inbox'].get('listid')
-            if not os.path.isdir(repo):
-                repo = None
+        repo_and_listid = None
+        if 'public-inbox' in self._config and not reflect:
+            public_inbox = self._config['public-inbox']
+            if (repo := public_inbox.get('repo')) is not None and os.path.isdir(repo):
+                if (listid := public_inbox.get('listid')) is not None:
+                    repo_and_listid = (repo, listid)
 
         if reflect:
             logger.info('Reflecting %s messages back to %s', len(msgs), identity)
@@ -527,7 +593,8 @@ class SendReceiveListener(object):
 
         for msg, destaddrs in msgs:
             subject = self.clean_header(msg.get('Subject'))
-            if repo:
+            if repo_and_listid is not None:
+                repo, listid = repo_and_listid
                 pmsg = copy.deepcopy(msg)
                 if pmsg.get('List-Id'):
                     pmsg.replace_header('List-Id', listid)
@@ -537,7 +604,9 @@ class SendReceiveListener(object):
                 logger.debug('Wrote %s to public-inbox at %s', subject, repo)
 
             origfrom = msg.get('From')
+            assert origfrom is not None
             origpair = utils.getaddresses([origfrom])[0]
+            assert origpair is not None
             origaddr = origpair[1]
             # Does it match one of our domains
             mydomain = False
@@ -573,6 +642,7 @@ class SendReceiveListener(object):
                     msg.add_header('Reply-To', f'<{origpair[1]}>')
 
                 body = msg.get_payload(decode=True)
+                assert isinstance(body, bytes)
                 # Add a From: header (if there isn't already one), but only if it's a patch
                 if diffre.search(body):
                     # Parse it as a message and see if we get a From: header
@@ -606,14 +676,15 @@ class SendReceiveListener(object):
                 logger.info('---DRYRUN MSG END---')
 
         smtp.close()
-        if repo:
+        if repo_and_listid is not None:
+            repo, _ = repo_and_listid
             # run it once after writing all messages
             logger.debug('Running public-inbox repo hook (if present)')
             ezpi.run_hook(repo)
         logger.info('%s %s messages for %s/%s', sentaction, len(msgs), identity, selector)
         self.send_success(resp, message=f'{sentaction} {len(msgs)} messages for {identity}/{selector}')
 
-    def on_post(self, req, resp):
+    def on_post(self, req: falcon.Request, resp: falcon.Response) -> None:
         if not req.content_length:
             resp.status = falcon.HTTP_500
             resp.content_type = falcon.MEDIA_TEXT
@@ -621,15 +692,15 @@ class SendReceiveListener(object):
             return
         raw = req.bounded_stream.read()
         try:
-            jdata = json.loads(raw)
+            jdata: JSON = json.loads(raw)
         except Exception:
             resp.status = falcon.HTTP_500
             resp.content_type = falcon.MEDIA_TEXT
             resp.text = 'Failed to parse the request\n'
             return
-        action = jdata.get('action')
-        if not action:
+        if not isinstance(jdata, Mapping) or (action := jdata.get('action')) is None:
             logger.critical('Action not set from %s', req.remote_addr)
+            return
 
         logger.info('Action: %s; from: %s', action, req.remote_addr)
         if action == 'auth-new':
@@ -666,6 +737,9 @@ if gpgbin:
     patatt.GPGBIN = gpgbin
 
 dburl = parser['main'].get('dburl')
+if not dburl:
+    sys.stderr.write('main.dburl is not set in CONFIG')
+    sys.exit(1)
 # By default, recycle db connections after 5 min
 db_pool_recycle = parser['main'].getint('dbpoolrecycle', 300)
 engine = sa.create_engine(dburl, pool_recycle=db_pool_recycle)
diff --git a/pyproject.toml b/pyproject.toml
index 8428c5b..c08f47e 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -41,6 +41,13 @@ dev = [
     "ruff",
     "types-requests",
 ]
+misc = [
+    "ezpi",
+    "falcon",
+    "instructor",
+    "pydantic",
+    "sqlalchemy",
+]
 
 [project.optional-dependencies]
 completion = [

-- 
2.53.0


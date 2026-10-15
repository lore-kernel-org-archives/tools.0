Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED424846A
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 00:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022659; cv=none; b=VY4ODAcsSa8mj1vGpS5NTBbSZIAsPI6KbbFvRZSeZxfYX14fWJahpGbjbA0E0k0aTJiM5b6xCQotqWVG2rpdD8S6hAK5SPlsqWhx72Ur2hYVNfUVAoNcoPCq81aC9ubXhbVV+v/5vXfiQeH96tBNbzkYmK0hOYUbtMXP9H3VmGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022659; c=relaxed/simple;
	bh=mprqDaFS1F13rVcy9hOcOo0zI3LQnfFVV3SDbTZGVcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4Va6qAvruFOGHlG8yy8s0dvf7q2WvrSBBOBZLc+Wrmul4sHwSPNR/KV5pOroviKNCoDQSLrWQZ+8CcV7eBwT3lPnTm4usbxpTJ3u/5a/qvvHmfmGD1W5f7QIr7/fPOEdb27x0mVdopwyjB/PCGgMTxGGVzjEv5TbyZZh6K9LIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSz1hyz3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSz1hyz3"
Received: by smtp.kernel.org (Postfix)
	id E85491F000C7; Thu, 15 Oct 2026 00:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4FC1F000C4;
	Thu, 15 Oct 2026 00:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792022657;
	bh=3xALOqVUzevUHi92qVSj/oSsaa1fhazQ2XA6KkkCpO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mSz1hyz3FdPREAfj04SC+pWcbQAA/Ddwhj0QYoY1UKlIAml12pakxr9X6/hR/06kF
	 mO4Zlw5dCiO3FzLikY4wakl4XRIpHPLrN43wUd8z9tjdfvFjESzZf7gyQBgy5xYqvC
	 X0Z4fq6XDGCaqLsMCXV/LdqBrnojc7e8Rku4IwzCG40TKaP2w5pqhhCFlwJ/ZQDRMI
	 K9WjW2E6vAIkeW6A+7F8OOY5S1N6/E2XMxmS4Oj9EeA45ZPruTRA/VB1d8+XDcHP8m
	 daqE7s7y+Odr8ugMBmxBpTHj5DCDhTSvXdiN42skfyBRi409v6SMz2cY+EjsOcGJWR
	 eL+LU5a7gqThw==
From: Brian Masney <masneyb@kernel.org>
Date: Wed, 14 Oct 2026 20:03:40 -0400
Subject: [PATCH b4 3/4] review: add pw_fetch_maintainers()
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pw-delegate-v1-3-a393ae92152a@kernel.org>
References: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
In-Reply-To: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6599; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=mprqDaFS1F13rVcy9hOcOo0zI3LQnfFVV3SDbTZGVcQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIuSNRyPcnZcr5SLrL6kfUjkUw+y0L+PR1zrHmP6W5l1
 Lh8OoKro5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgImE32P4p/qrTHaT5UqP6jx1
 r7fhGau79Rkf7gnXVb25i+nwBKvfMxn+2bOv2KGmUG04n+G/QW5qznQXEXYP8TM1x+bcPO68PF6
 FCwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Patchwork only accepts a project maintainer as a patch delegate, so the
project's maintainers are the users that a delegate picker should offer.
Add a helper that reads them from the project endpoint.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/b4/review/_review.py | 57 +++++++++++++++++++++++++++++++++++++++
 src/tests/test_tui_pw.py | 69 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f094bc7..a65b6a4f549b 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -4152,6 +4152,63 @@ def pw_fetch_states(pwkey: str, pwurl: str, pwproj: str) -> List[Dict[str, Any]]
     return [{'slug': s, 'name': s.replace('-', ' ').title()} for s in default_slugs]
 
 
+def _pw_lookup_user_id(
+    pses: requests.Session, api_url: str, username: str
+) -> Optional[int]:
+    """Return the Patchwork User id for *username*, or None if not found.
+
+    The users endpoint searches username, names and email by substring, so
+    pick out the exact username match.
+    """
+    users_url = '/'.join((api_url, 'users', ''))
+    resp = pses.get(users_url, params={'q': username})
+    if resp.status_code != 200:
+        raise RuntimeError(f'Patchwork API error: {resp.status_code} {resp.reason}')
+    for u in resp.json():
+        if u.get('username') == username and u.get('id'):
+            return int(u['id'])
+    return None
+
+
+def pw_fetch_maintainers(pwkey: str, pwurl: str, pwproj: str) -> List[Dict[str, Any]]:
+    """Return the maintainers of a Patchwork project.
+
+    Patchwork only accepts a project maintainer as a patch delegate, so
+    this is the list of users a patch can be delegated to.
+
+    Returns a list of user dicts with 'id', 'username', 'name' and 'email'
+    keys, sorted by username.  The 'id' is the User id that a patch's
+    delegate field takes.
+    """
+    pses, api_url = b4.get_patchwork_session(pwkey, pwurl)
+    # The projects endpoint accepts the project linkname in place of its id.
+    project_url = '/'.join((api_url, 'projects', pwproj, ''))
+    resp = pses.get(project_url)
+    if resp.status_code != 200:
+        raise RuntimeError(f'Patchwork API error: {resp.status_code} {resp.reason}')
+    users: List[Dict[str, Any]] = []
+    for m in resp.json().get('maintainers', []):
+        username = m.get('username')
+        if not username:
+            continue
+        # The maintainers list carries UserProfile ids, not the User ids
+        # that the delegate field expects, so resolve each one by username.
+        user_id = _pw_lookup_user_id(pses, api_url, username)
+        if user_id is None:
+            logger.debug('Could not find Patchwork user %s', username)
+            continue
+        name = ' '.join(p for p in (m.get('first_name'), m.get('last_name')) if p)
+        users.append(
+            {
+                'id': user_id,
+                'username': username,
+                'name': name,
+                'email': m.get('email') or '',
+            }
+        )
+    return sorted(users, key=lambda u: u['username'].lower())
+
+
 def pw_fetch_checks(
     pwkey: str, pwurl: str, patch_ids: List[int]
 ) -> List[Dict[str, Any]]:
diff --git a/src/tests/test_tui_pw.py b/src/tests/test_tui_pw.py
index c7af958e895f..1d7f62681f26 100644
--- a/src/tests/test_tui_pw.py
+++ b/src/tests/test_tui_pw.py
@@ -930,3 +930,72 @@ class TestPwApplyErrorText:
             assert (
                 '0 updated, 2 failed: state: Object with slug=reviewing does not exist.'
             ) in notices
+
+
+# ---------------------------------------------------------------------------
+# Changing the delegate
+# ---------------------------------------------------------------------------
+
+
+class TestPwFetchMaintainers:
+    """pw_fetch_maintainers reads the project's maintainers list."""
+
+    def test_resolves_user_ids(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        """The maintainers list carries UserProfile ids; the delegate field
+        wants User ids, so each maintainer is looked up by username."""
+
+        class _Resp:
+            status_code = 200
+            reason = 'OK'
+
+            def __init__(self, body: Any) -> None:
+                self._body = body
+
+            def json(self) -> Any:
+                return self._body
+
+        # Users endpoint search is a substring match across several fields.
+        users_db: List[Dict[str, Any]] = [
+            {'id': 101, 'username': 'zed'},
+            {'id': 102, 'username': 'amy'},
+            {'id': 103, 'username': 'amyx'},
+        ]
+
+        class _Session:
+            def __init__(self) -> None:
+                self.calls: List[Any] = []
+
+            def get(self, url: str, params: Optional[Dict[str, str]] = None) -> _Resp:
+                self.calls.append((url, params))
+                if url.endswith('/projects/proj/'):
+                    return _Resp(
+                        {
+                            'maintainers': [
+                                {
+                                    'id': 2,
+                                    'username': 'zed',
+                                    'first_name': 'Zed',
+                                    'last_name': 'Zee',
+                                    'email': 'z@x',
+                                },
+                                {'id': 1, 'username': 'amy', 'email': 'a@x'},
+                                {'id': 3, 'username': 'ghost', 'email': 'g@x'},
+                            ]
+                        }
+                    )
+                assert url.endswith('/users/')
+                assert params is not None
+                q = params['q']
+                return _Resp([u for u in users_db if q in u['username']])
+
+        sess = _Session()
+        monkeypatch.setattr(
+            b4, 'get_patchwork_session', lambda key, url: (sess, 'https://pw/api/1.2')
+        )
+        users = b4.review.pw_fetch_maintainers('k', 'https://pw', 'proj')
+        assert sess.calls[0] == ('https://pw/api/1.2/projects/proj/', None)
+        # 'ghost' has no matching user and is left out.
+        assert users == [
+            {'id': 102, 'username': 'amy', 'name': '', 'email': 'a@x'},
+            {'id': 101, 'username': 'zed', 'name': 'Zed Zee', 'email': 'z@x'},
+        ]

-- 
2.55.0


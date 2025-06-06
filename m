Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0AE323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239492; cv=none; b=G0kX/9Wal8GmQf+FQD3zo7wEkaCaauakIYlUdt/WMvHL1FaeLmY65sLIsvGE0W7ekmpiG7BuorwVj21qCn843wawx4MMMaWA/r7/fg1q8WxKv6djW2p79knBibQFPgiJLRb0PPuqjx8XDTzJUNHU8NQMRY3IDCMq/QnWD0503c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239492; c=relaxed/simple;
	bh=LABXDVmEhd+LU77rpXvpH0Zy1pjNo3rQVsJb6meMnr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecQDfeRVSZBIMDjNPWw29GgQpjgRG7kVliP3HVeZ1aj3GxPkdZaJ5MvKAMTrIvd/ooz3plYRxuEOWlUXMwCl06x8AChonzUjjQ9TEuEx2rqI+djnOdkLqiHK6nqTXzmbeEyeyxtPrf0ACzvUWRimZKqLHaqa7DSzVm60ush5mXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ffl008Yh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ffl008Yh"
Received: by smtp.kernel.org (Postfix)
	id C647AC4CEEB; Fri,  6 Jun 2025 19:51:32 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1ED3DC4CEF2
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1ED3DC4CEF2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a585dc5f4aso32381471cf.2
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239489; x=1749844289; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HDpOSeV/AtyBdltRafSxebdhxVMnddrNBl1ZNFGhHs=;
        b=Ffl008YhzTpWzHc8QJHU5hQDhlT8h4dKEf5f0mbyrSgfzWRXWYkXbe9niXgfAhTHGA
         G7HOOvo1v7eyM7m+UFm3ldwOCr+13aKX33DlbN8xQKqOCdPQPgHx6IIFKUTpPFsUBuGb
         eiarmaSMqtA4zUNwwQKSyQAsQCGPofkYhWeRxLfWfyflAR3bKX6R63R7ebBSJcRPhKEZ
         atqKpwizvoWgPsoN8r8jR0fT2bMD8CeBUpJKqb1pau6W/eu0twGoEfIF6oYcGDGQOdj/
         Q/YhK4j6DE8h2tnxG4TWQtfSed+R/wbf9wsegKpicIsNglwIfNOWyt44NNw0zfRXxFE6
         GyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239489; x=1749844289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HDpOSeV/AtyBdltRafSxebdhxVMnddrNBl1ZNFGhHs=;
        b=YgCoFkIBY/gqKna6fSqLVFCGx5sUZxAol5hWCbRefD8n4DCbqBteBrK0OxH2G9jyeV
         r2dbVMAxsGX8LpV2FjgI7BKuilJncQbm6zzdM4G2fXdUyX79+X0CO2gHQLQh1kk4WIlh
         B6zGm17lmc7sdJbgs2ifn8ChUTGNu0rBDabijrcFhTWfXTJK+iqd1ugHlzum8lynjd99
         cFdXdpbWs4bjFBOzt8L38KnD04b+Q1q3DT+c+0ML2T/Mor7tqjm33IhkkSmy/ijG4Cf8
         lF3XPRpT9ym0JDUyQy4FHcg0/MPKm4i3Zw0TT9i4Dc729IyQ0Hxwm+g20MObVFlTy0nv
         5xQg==
X-Gm-Message-State: AOJu0YzSMkTZQs0fAEZFf6Fl39CYQia4J7xOHq0qrIp7Amky20ZNPRZG
	8JxBg3skUxgwcpT5I9t3ndgFXCoEOf80xkh3nMjQLxVDczhiuLNNDjrd
X-Gm-Gg: ASbGncuCdslul09ZHLxYXnej6rIFLPih4Zip7oiEvSa25WRYz5F7gl8VXAfbsTYALOl
	yNXYP6E2cNCk+ILeqKP1Qk58ep97QBimsA122sbLWdEkN2X80DgBbSSshDQyTZihT2koQ8mvm4u
	e6z038VM/2dTni1EJgT34HYof6cuwWJyAsgr103rV4pgTaCgaPpJOpFsV7iE5iF1zVu7QdxVqe5
	nj4AjLZf402vVM2S49/dltH5cE5aPqjnXASGdCJBg6tdTXNSzaHVomd9rFqrhg9ffHvUf4ZmIUk
	uGn0ieLM8Rd9ZVlQKyi0iRXAyX9zcrmOy+y4XoC2/p/51kYvU0ssoqyvkQy6khBIuKYFB645htP
	JnNIqselp
X-Google-Smtp-Source: AGHT+IF8CQzWJ9soYaqNk5K/2/7LFClfr+a4tn78lhSFVU9y/h2X9JWY1V0FLhHk0yJ2/cvTpKAmKg==
X-Received: by 2002:a05:622a:1e86:b0:4a4:2c92:27e3 with SMTP id d75a77b69052e-4a5b9d7cef6mr81511161cf.34.1749239488734;
        Fri, 06 Jun 2025 12:51:28 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:28 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:21 -0400
Subject: [PATCH b4 10/10] Add missing type annotations
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-uv-compat-v1-10-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Unannotated functions are skipped by mypy, giving a false impression of
the completeness of type annotations. Add missing generics.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/__init__.py         | 82 ++++++++++++++++++++++------------------------
 src/b4/command.py          | 32 +++++++++---------
 src/b4/ez.py               | 38 ++++++++++-----------
 src/b4/kr.py               |  3 +-
 src/b4/mbox.py             |  2 +-
 src/b4/ty.py               | 12 +++----
 src/tests/conftest.py      | 15 +++++----
 src/tests/test___init__.py | 19 ++++++-----
 src/tests/test_ez.py       |  6 ++--
 src/tests/test_mbox.py     |  4 ++-
 10 files changed, 112 insertions(+), 101 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index b8f4c4c..e662196 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -51,7 +51,7 @@ emlpolicy = email.policy.EmailPolicy(utf8=True, cte_type='8bit', max_line_length
 qspecials = re.compile(r'[()<>@,:;.\"\[\]]')
 
 try:
-    import dkim  # type: ignore[import]
+    import dkim  # type: ignore[import-not-found]
 
     can_dkim = True
 except ModuleNotFoundError:
@@ -71,7 +71,7 @@ __VERSION__ = '0.15-dev'
 PW_REST_API_VERSION = '1.2'
 
 
-def _dkim_log_filter(record):
+def _dkim_log_filter(record: logging.LogRecord) -> bool:
     # Hide all dkim logging output in normal operation by setting the level to
     # DEBUG. If debugging output has been enabled then prefix dkim logging
     # output to make its origin clear.
@@ -176,7 +176,7 @@ class LoreMailbox:
     followups: List['LoreMessage']
     unknowns: List['LoreMessage']
 
-    def __init__(self):
+    def __init__(self) -> None:
         self.msgid_map = dict()
         self.series = dict()
         self.covers = dict()
@@ -184,7 +184,7 @@ class LoreMailbox:
         self.followups = list()
         self.unknowns = list()
 
-    def __repr__(self):
+    def __repr__(self) -> str:
         out = list()
         for key, lser in self.series.items():
             out.append(str(lser))
@@ -202,7 +202,7 @@ class LoreMailbox:
             return self.msgid_map[msgid]
         return None
 
-    def partial_reroll(self, revision, sloppytrailers):
+    def partial_reroll(self, revision: int, sloppytrailers: bool) -> None:
         # Is it a partial reroll?
         # To qualify for a partial reroll:
         # 1. Needs to be version > 1
@@ -516,7 +516,7 @@ class LoreSeries:
         self.trailer_mismatches = set()
         self.subject = '(untitled)'
 
-    def __repr__(self):
+    def __repr__(self) -> str:
         out = list()
         out.append('- Series: [v%s] %s' % (self.revision, self.subject))
         out.append('  revision: %s' % self.revision)
@@ -839,7 +839,7 @@ class LoreSeries:
 
         return len(self.indexes), mismatches
 
-    def find_base(self, gitdir: Optional[str], branches: Optional[list] = None, maxdays: int = 30) -> Tuple[str, int, int]:
+    def find_base(self, gitdir: Optional[str], branches: Optional[List[str]] = None, maxdays: int = 30) -> Tuple[str, int, int]:
         if self.indexes is None:
             self.populate_indexes()
         if self.indexes is None or not len(self.indexes):
@@ -1037,7 +1037,7 @@ class LoreSeries:
 
         return start_commit, end_commit
 
-    def save_cover(self, outfile):
+    def save_cover(self, outfile: str) -> None:
         cover_msg = self.patches[0].get_am_message(add_trailers=False)
         with open(outfile, 'wb') as fh:
             fh.write(LoreMessage.get_msg_as_bytes(cover_msg, headers='decode'))
@@ -1197,7 +1197,7 @@ class LoreMessage:
     pw_ci_status: Optional[str]
     local_ci_status: Optional[List[Tuple[str, str]]]
 
-    def __init__(self, msg):
+    def __init__(self, msg: EmailMessage) -> None:
         self.msg = msg
 
         # set some defaults
@@ -1233,10 +1233,10 @@ class LoreMessage:
         self.counters_inferred = self.lsubject.counters_inferred
 
         # Loaded when properties are called
-        self._attestors = None
-        self._git_patch_id = None
-        self._pwhash = None
-        self._blob_indexes = None
+        self._attestors: Optional[List['LoreAttestor']] = None
+        self._git_patch_id: Optional[str] = None
+        self._pwhash: Optional[str] = None
+        self._blob_indexes: Optional[Set[Tuple[str, str, str, str]]] = None
 
         # Handle [PATCH 6/5]
         if self.counter > self.expected:
@@ -1605,7 +1605,7 @@ class LoreMessage:
                     self.local_ci_status.extend(status)
 
     @staticmethod
-    def get_patchwork_data_by_msgid(msgid: str) -> dict:
+    def get_patchwork_data_by_msgid(msgid: str) -> Dict[str, str]:
         config = get_main_config()
         pwkey = str(config.get('pw-key', ''))
         pwurl = str(config.get('pw-url', ''))
@@ -1647,7 +1647,7 @@ class LoreMessage:
         save_cache(pwdata, pwurl + pwproj + msgid, suffix='lookup', is_json=True)
         return pwdata
 
-    def get_patchwork_info(self) -> Optional[dict]:
+    def get_patchwork_info(self) -> Optional[Dict[str,str]]:
         if not self.pwhash:
             return None
         try:
@@ -1721,7 +1721,7 @@ class LoreMessage:
 
         return checkmark, trailers, critical
 
-    def __repr__(self):
+    def __repr__(self) -> str:
         out = list()
         out.append('msgid: %s' % self.msgid)
         out.append(str(self.lsubject))
@@ -1837,7 +1837,7 @@ class LoreMessage:
         return new_hdrval.strip()
 
     @staticmethod
-    def wrap_header(hdr, width: int = 75, nl: str = '\n',
+    def wrap_header(hdr: Tuple[str, str], width: int = 75, nl: str = '\n',
                     transform: Literal['encode', 'decode', 'preserve'] = 'preserve') -> bytes:
         hname, hval = hdr
         if hname.lower() in ('to', 'cc', 'from', 'x-original-from'):
@@ -1911,7 +1911,7 @@ class LoreMessage:
         return bdata
 
     @staticmethod
-    def get_parts_from_header(hstr: str) -> dict:
+    def get_parts_from_header(hstr: str) -> Dict[str, str]:
         hstr = re.sub(r'\s*', '', hstr)
         hdata = dict()
         for chunk in hstr.split(';'):
@@ -1997,7 +1997,7 @@ class LoreMessage:
                 line = filename_match.group(1) + ' ' + filename
             elif hunk_match:
                 # remove line numbers, but leave line counts
-                def fn(x):
+                def fn(x: Optional[str]) -> int:
                     if not x:
                         return 1
                     return int(x)
@@ -2462,7 +2462,7 @@ class LoreSubject:
     counters_inferred: bool
     prefixes: List[str]
 
-    def __init__(self, subject):
+    def __init__(self, subject: str) -> None:
         # Subject-based info
         self.reply = False
         self.resend = False
@@ -2560,7 +2560,7 @@ class LoreSubject:
         else:
             return f'[PATCH] {self.subject}'
 
-    def get_slug(self, sep='_', with_counter: bool = True) -> str:
+    def get_slug(self, sep: str = '_', with_counter: bool = True) -> str:
         unsafe = self.subject
         if with_counter:
             unsafe = '%04d%s%s' % (self.counter, sep, unsafe)
@@ -2618,7 +2618,7 @@ class LoreAttestor:
         return ATT_FAIL_SIMPLE
 
     @property
-    def trailer(self):
+    def trailer(self) -> str:
         if self.keyalgo:
             mode = self.keyalgo
         else:
@@ -2626,7 +2626,7 @@ class LoreAttestor:
 
         return '%s/%s' % (mode, self.identity.lower())
 
-    def check_time_drift(self, emldate, maxdays: int = 30) -> bool:
+    def check_time_drift(self, emldate: datetime.datetime, maxdays: int = 30) -> bool:
         if not self.passing or self.signtime is None:
             return False
 
@@ -2667,7 +2667,7 @@ class LoreAttestor:
             logger.debug('Failed parsing t=%s', ts)
         return None
 
-    def __repr__(self):
+    def __repr__(self) -> str:
         out = list()
         out.append('    mode: %s' % self.mode)
         out.append('   level: %s' % self.level)
@@ -2682,7 +2682,7 @@ class LoreAttestor:
 
 
 class LoreAttestorDKIM(LoreAttestor):
-    def __init__(self, passing: bool, identity: str, signtime: Optional[datetime.datetime], errors: list) -> None:
+    def __init__(self, passing: bool, identity: str, signtime: Optional[datetime.datetime], errors: List[str]) -> None:
         super().__init__()
         self.mode = 'DKIM'
         self.level = 'domain'
@@ -2698,7 +2698,7 @@ class LoreAttestorDKIM(LoreAttestor):
 
 class LoreAttestorPatatt(LoreAttestor):
     def __init__(self, result: bool, identity: str, signtime: Optional[datetime.datetime], keysrc: str, keyalgo: str,
-                 errors: list) -> None:
+                 errors: List[str]) -> None:
         super().__init__()
         self.mode = 'patatt'
         self.level = 'person'
@@ -2804,7 +2804,7 @@ def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, usernam
     return None
 
 
-def git_get_command_lines(gitdir: Optional[str], args: list) -> List[str]:
+def git_get_command_lines(gitdir: Optional[str], args: List[str]) -> List[str]:
     ecode, out = git_run_command(gitdir, args)
     lines = list()
     if out:
@@ -2871,7 +2871,7 @@ def in_directory(dirname: str) -> Generator[bool, None, None]:
         os.chdir(cdir)
 
 
-def setup_config(cmdargs: argparse.Namespace):
+def setup_config(cmdargs: argparse.Namespace) -> None:
     """Setup configuration options. Needs to be called before accessing any of
     the config options."""
     _setup_main_config(cmdargs)
@@ -2881,7 +2881,7 @@ def setup_config(cmdargs: argparse.Namespace):
     _setup_sendemail_config(cmdargs)
 
 
-def _cmdline_config_override(cmdargs: argparse.Namespace, config: dict, section: str):
+def _cmdline_config_override(cmdargs: argparse.Namespace, config: Dict[str, Any], section: str) -> None:
     """Use cmdline.config to set and override config values for section."""
     if not cmdargs.config:
         return
@@ -2897,14 +2897,14 @@ def _cmdline_config_override(cmdargs: argparse.Namespace, config: dict, section:
     config.update(config_override)
 
 
-def git_set_config(fullpath: Optional[str], param: str, value: str, operation: str = '--replace-all'):
+def git_set_config(fullpath: Optional[str], param: str, value: str, operation: str = '--replace-all') -> int:
     args = ['config', operation, param, value]
     ecode, out = git_run_command(fullpath, args)
     return ecode
 
 
-def get_config_from_git(regexp: str, defaults: Optional[dict] = None,
-                        multivals: Optional[list] = None, source: Optional[str] = None) -> dict:
+def get_config_from_git(regexp: str, defaults: Optional[Dict[str, Any]] = None,
+                        multivals: Optional[List[str]] = None, source: Optional[str] = None) -> Dict[str, Any]:
     if multivals is None:
         multivals = list()
     args = ['config']
@@ -3101,7 +3101,7 @@ def save_cache(contents: Any, identifier: str, suffix: Optional[str] = None, is_
         logger.debug('Could not write cache %s for %s', fullpath, identifier)
 
 
-def _setup_user_config(cmdargs: argparse.Namespace):
+def _setup_user_config(cmdargs: argparse.Namespace) -> None:
     global USER_CONFIG
 
     USER_CONFIG = get_config_from_git(r'user\..*')
@@ -3470,7 +3470,7 @@ def get_pi_thread_by_url(t_mbx_url: str, nocache: bool = False) -> Optional[List
 
 
 def get_pi_thread_by_msgid(msgid: str, nocache: bool = False,
-                           onlymsgids: Optional[set] = None,
+                           onlymsgids: Optional[Set[str]] = None,
                            with_thread: bool = True) -> Optional[List[EmailMessage]]:
     qmsgid = urllib.parse.quote_plus(msgid, safe='@')
     config = get_main_config()
@@ -3810,7 +3810,7 @@ def save_mboxrd_mbox(msgs: List[EmailMessage], dest: BinaryIO, mangle_from: bool
         gen.flatten(msg)
 
 
-def save_maildir(msgs: list, dest) -> None:
+def save_maildir(msgs: List[EmailMessage], dest: str) -> None:
     d_new = os.path.join(dest, 'new')
     pathlib.Path(d_new).mkdir(parents=True)
     d_cur = os.path.join(dest, 'cur')
@@ -3826,7 +3826,7 @@ def save_maildir(msgs: list, dest) -> None:
         os.rename(os.path.join(d_tmp, f'{slug}.eml'), os.path.join(d_new, f'{slug}.eml'))
 
 
-def get_mailinfo(bmsg: bytes, scissors: bool = False) -> Tuple[dict, bytes, bytes]:
+def get_mailinfo(bmsg: bytes, scissors: bool = False) -> Tuple[Dict[str, str], bytes, bytes]:
     with tempfile.TemporaryDirectory() as tfd:
         m_out = os.path.join(tfd, 'm')
         p_out = os.path.join(tfd, 'p')
@@ -3899,7 +3899,7 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
     return SENDEMAIL_CONFIG
 
 
-def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, list, None], str]:
+def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
     sconfig = get_sendemail_config()
     # Limited support for smtp settings to begin with, but should cover the vast majority of cases
     fromaddr = str(sconfig.get('from'))
@@ -3994,7 +3994,7 @@ def get_patchwork_session(pwkey: str, pwurl: str) -> Tuple[requests.Session, str
     return session, url
 
 
-def patchwork_set_state(msgids: List[str], state: str) -> bool:
+def patchwork_set_state(msgids: List[str], state: str) -> None:
     # Do we have a pw-key defined in config?
     config = get_main_config()
     pwkey = str(config.get('pw-key', ''))
@@ -4002,7 +4002,7 @@ def patchwork_set_state(msgids: List[str], state: str) -> bool:
     pwproj = str(config.get('pw-project', ''))
     if not (pwkey and pwurl and pwproj):
         logger.debug('Patchwork support requires pw-key, pw-url and pw-project settings')
-        return False
+        return
     pses, url = get_patchwork_session(pwkey, pwurl)
     patches_url = '/'.join((url, 'patches'))
     tochange = list()
@@ -4042,8 +4042,6 @@ def patchwork_set_state(msgids: List[str], state: str) -> bool:
             except requests.exceptions.RequestException as ex:
                 logger.debug('Patchwork REST error: %s', ex)
 
-    return True
-
 
 def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, None], msgs: Sequence[EmailMessage],
               fromaddr: Optional[str], destaddrs: Optional[Union[Set[str], List[str]]] = None,
@@ -4250,7 +4248,7 @@ def get_email_signature() -> str:
     return signature
 
 
-def retrieve_messages(cmdargs: argparse.Namespace) -> Tuple[Optional[str], Optional[list]]:
+def retrieve_messages(cmdargs: argparse.Namespace) -> Tuple[Optional[str], Optional[List[EmailMessage]]]:
     msgid = None
     with_thread = True
     pickings = set()
diff --git a/src/b4/command.py b/src/b4/command.py
index 5473df3..f17f71c 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -10,10 +10,12 @@ import logging
 import b4
 import sys
 
+from typing import Any, Optional, Sequence, Union
+
 logger = b4.logger
 
 
-def cmd_retrieval_common_opts(sp):
+def cmd_retrieval_common_opts(sp: argparse.ArgumentParser) -> None:
     sp.add_argument('msgid', nargs='?',
                     help='Message ID to process, or pipe a raw message')
     sp.add_argument('-m', '--use-local-mbox', dest='localmbox', default=None,
@@ -26,7 +28,7 @@ def cmd_retrieval_common_opts(sp):
                     help='Only retrieve the message matching the msgid and ignore the rest of the thread')
 
 
-def cmd_mbox_common_opts(sp):
+def cmd_mbox_common_opts(sp: argparse.ArgumentParser) -> None:
     cmd_retrieval_common_opts(sp)
     sp.add_argument('-o', '--outdir', default='.',
                     help='Output into this directory (or use - to output mailbox contents to stdout)')
@@ -38,7 +40,7 @@ def cmd_mbox_common_opts(sp):
                     help='Save as maildir (avoids mbox format ambiguities)')
 
 
-def cmd_am_common_opts(sp):
+def cmd_am_common_opts(sp: argparse.ArgumentParser) -> None:
     sp.add_argument('-v', '--use-version', dest='wantver', type=int, default=None,
                     help='Get a specific version of the patch/series')
     sp.add_argument('-t', '--apply-cover-trailers', dest='covertrailers', action='store_true', default=False,
@@ -68,59 +70,59 @@ def cmd_am_common_opts(sp):
                       help='Add a Message-ID: trailer to every patch')
 
 
-def cmd_mbox(cmdargs):
+def cmd_mbox(cmdargs: argparse.Namespace) -> None:
     import b4.mbox
     b4.mbox.main(cmdargs)
 
 
-def cmd_kr(cmdargs):
+def cmd_kr(cmdargs: argparse.Namespace) -> None:
     import b4.kr
     b4.kr.main(cmdargs)
 
 
-def cmd_prep(cmdargs):
+def cmd_prep(cmdargs: argparse.Namespace) -> None:
     import b4.ez
     b4.ez.cmd_prep(cmdargs)
 
 
-def cmd_trailers(cmdargs):
+def cmd_trailers(cmdargs: argparse.Namespace) -> None:
     import b4.ez
     b4.ez.cmd_trailers(cmdargs)
 
 
-def cmd_send(cmdargs):
+def cmd_send(cmdargs: argparse.Namespace) -> None:
     import b4.ez
     b4.ez.cmd_send(cmdargs)
 
 
-def cmd_am(cmdargs):
+def cmd_am(cmdargs: argparse.Namespace) -> None:
     import b4.mbox
     b4.mbox.main(cmdargs)
 
 
-def cmd_shazam(cmdargs):
+def cmd_shazam(cmdargs: argparse.Namespace) -> None:
     import b4.mbox
     b4.mbox.main(cmdargs)
 
 
-def cmd_pr(cmdargs):
+def cmd_pr(cmdargs: argparse.Namespace) -> None:
     import b4.pr
     b4.pr.main(cmdargs)
 
 
-def cmd_ty(cmdargs):
+def cmd_ty(cmdargs: argparse.Namespace) -> None:
     import b4.ty
     b4.ty.main(cmdargs)
 
 
-def cmd_diff(cmdargs):
+def cmd_diff(cmdargs: argparse.Namespace) -> None:
     import b4.diff
     b4.diff.main(cmdargs)
 
 
 class ConfigOption(argparse.Action):
     """Action class for storing key=value arguments in a dict."""
-    def __call__(self, parser, namespace, keyval, option_string=None):
+    def __call__(self, parser: argparse.ArgumentParser, namespace: argparse.Namespace, keyval: Union[str, Sequence[Any], None], option_string: Optional[str] = None) -> None:
         config = getattr(namespace, self.dest, None)
 
         if config is None:
@@ -395,7 +397,7 @@ def setup_parser() -> argparse.ArgumentParser:
     return parser
 
 
-def cmd():
+def cmd() -> None:
     parser = setup_parser()
     cmdargs = parser.parse_args()
     logger.setLevel(logging.DEBUG)
diff --git a/src/b4/ez.py b/src/b4/ez.py
index bf7b96c..ad534df 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -28,7 +28,7 @@ import tarfile
 import hashlib
 import urllib.parse
 
-from typing import Optional, Tuple, List, Union, Dict, Set
+from typing import Any, Optional, Tuple, List, Union, Dict, Set
 from email import utils
 from string import Template
 
@@ -589,13 +589,13 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         logger.info('NOTE: any follow-up trailers were ignored; apply them with b4 trailers -u')
 
 
-def make_magic_json(data: dict) -> str:
+def make_magic_json(data: Dict[str, Any]) -> str:
     mj = (f'{MAGIC_MARKER}\n'
           '# This section is used internally by b4 prep for tracking purposes.\n')
     return mj + json.dumps(data, indent=2)
 
 
-def load_cover(strip_comments: bool = False, usebranch: Optional[str] = None) -> Tuple[str, dict]:
+def load_cover(strip_comments: bool = False, usebranch: Optional[str] = None) -> Tuple[str, Dict[str, Any]]:
     strategy = get_cover_strategy(usebranch)
     if strategy in {'commit', 'tip-commit'}:
         cover_commit = find_cover_commit(usebranch=usebranch)
@@ -636,7 +636,7 @@ def load_cover(strip_comments: bool = False, usebranch: Optional[str] = None) ->
     return cover.strip(), tracking
 
 
-def store_cover(content: str, tracking: dict, new: bool = False) -> None:
+def store_cover(content: str, tracking: Dict[str, Any], new: bool = False) -> None:
     strategy = get_cover_strategy()
     if strategy in {'commit', 'tip-commit'}:
         cover_message = content + '\n\n' + make_magic_json(tracking)
@@ -654,9 +654,9 @@ def store_cover(content: str, tracking: dict, new: bool = False) -> None:
                 raise RuntimeError('Error saving cover letter (commit not found)')
             fred = FRCommitMessageEditor()
             fred.add(commit, cover_message)
-            args = fr.FilteringOptions.parse_args(['--force', '--quiet', '--refs', f'{commit}~1..HEAD'])
-            args.refs = [f'{commit}~1..HEAD']
-            frf = fr.RepoFilter(args, commit_callback=fred.callback)
+            frargs = fr.FilteringOptions.parse_args(['--force', '--quiet', '--refs', f'{commit}~1..HEAD'])
+            frargs.refs = [f'{commit}~1..HEAD']
+            frf = fr.RepoFilter(frargs, commit_callback=fred.callback)
             logger.info('Invoking git-filter-repo to update the cover letter.')
             frf.run()
 
@@ -760,18 +760,18 @@ def find_cover_commit(usebranch: Optional[str] = None) -> Optional[str]:
 
 
 class FRCommitMessageEditor:
-    edit_map: dict
+    edit_map: Dict[bytes, bytes]
 
-    def __init__(self, edit_map: Optional[dict] = None):
+    def __init__(self, edit_map: Optional[Dict[bytes, bytes]] = None):
         if edit_map:
             self.edit_map = edit_map
         else:
             self.edit_map = dict()
 
-    def add(self, commit: str, message: str):
+    def add(self, commit: str, message: str) -> None:
         self.edit_map[commit.encode()] = message.encode()
 
-    def callback(self, commit, metadata):
+    def callback(self, commit: fr.Commit, metadata: Dict[str, str]) -> None:
         if commit.original_id in self.edit_map:
             commit.message = self.edit_map[commit.original_id]
 
@@ -1271,7 +1271,7 @@ def get_series_details(start_commit: Optional[str] = None, usebranch: Optional[s
     return base_commit, start_commit, end_commit, oneline, shortlog.rstrip(), diffstat.rstrip()
 
 
-def print_pretty_addrs(addrs: list, hdrname: str) -> None:
+def print_pretty_addrs(addrs: List[str], hdrname: str) -> None:
     if len(addrs) < 1:
         return
     logger.info('%s: %s', hdrname, b4.format_addrs([addrs[0]]))
@@ -1339,7 +1339,7 @@ def get_cover_dests(cbody: str) -> Tuple[List, List, str]:
 
 
 def add_cover(csubject: b4.LoreSubject, msgid_tpt: str, patches: List[Tuple[str, email.message.EmailMessage]],
-              cbody: str, datets: int, thread: bool = True):
+              cbody: str, datets: int, thread: bool = True) -> None:
     fp = patches[0][1]
     cmsg = email.message.EmailMessage()
     cmsg.add_header('From', fp['From'])
@@ -1420,7 +1420,7 @@ def get_cover_subject_body(cover: str) -> Tuple[b4.LoreSubject, str]:
     return lsubject, cbody
 
 
-def rethread(patches: List[Tuple[str, email.message.EmailMessage]]):
+def rethread(patches: List[Tuple[str, email.message.EmailMessage]]) -> None:
     refto = patches[0][1].get('message-id')
     for commit, msg in patches[1:]:
         msg.add_header('References', refto)
@@ -2162,7 +2162,7 @@ def get_sent_tagname(tagbase: str, tagprefix: str, revstr: Union[str, int]) -> T
     return f'{tagprefix}{tagbase}-v{revision}', revision
 
 
-def reroll(mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PREFIX):
+def reroll(mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PREFIX) -> None:
     # Remove signature
     chunks = tag_msg.rsplit('\n-- \n')
     if len(chunks) > 1:
@@ -2299,7 +2299,7 @@ def show_revision() -> None:
                 logger.info('  %s: %s', rn, config['linkmask'] % link)
 
 
-def write_to_tar(bio_tar: tarfile.TarFile, name, mtime, bio_file: io.BytesIO):
+def write_to_tar(bio_tar: tarfile.TarFile, name: str, mtime: int, bio_file: io.BytesIO) -> None:
     tifo = tarfile.TarInfo(name)
     tuser = os.environ.get('USERNAME', 'user')
     tuid = os.getuid()
@@ -2316,7 +2316,7 @@ def write_to_tar(bio_tar: tarfile.TarFile, name, mtime, bio_file: io.BytesIO):
 
 def get_prep_managed_branches(gitdir: Optional[str] = None) -> List[str]:
     lines = b4.git_get_command_lines(gitdir, ['show-ref', '--heads'])
-    mybranches = list()
+    mybranches: List[str] = list()
     if not lines:
         logger.debug('Git show-ref returned no heads')
         return mybranches
@@ -2555,7 +2555,7 @@ def force_revision(forceto: int) -> None:
     store_cover(cover, tracking)
 
 
-def compare(compareto: str, execvp: bool = True, range_diff_opts: str = None) -> Union[str, None]:
+def compare(compareto: str, execvp: bool = True, range_diff_opts: Optional[str] = None) -> Union[str, None]:
     cover, tracking = load_cover()
     # Try the new format first
     tagname, revision = get_sent_tagname(tracking['series']['change-id'], SENT_TAG_PREFIX, compareto)
@@ -2736,7 +2736,7 @@ def store_preflight_check(identity: str) -> None:
     b4.save_cache(pf_checks, cacheid, suffix='checks', is_json=True)
 
 
-def set_prefixes(prefixes: list, additive: bool = False) -> None:
+def set_prefixes(prefixes: List[str], additive: bool = False) -> None:
     cover, tracking = load_cover()
     old_prefixes = tracking['series'].get('prefixes', list())
     if len(prefixes) == 1 and not prefixes[0].strip():
diff --git a/src/b4/kr.py b/src/b4/kr.py
index cdca198..0e7bc1d 100644
--- a/src/b4/kr.py
+++ b/src/b4/kr.py
@@ -5,6 +5,7 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
+import argparse
 import os
 import sys
 import pathlib
@@ -15,7 +16,7 @@ import b4
 logger = b4.logger
 
 
-def main(cmdargs):
+def main(cmdargs: argparse.Namespace) -> None:
     if cmdargs.showkeys:
         msgid, msgs = b4.retrieve_messages(cmdargs)
         logger.info('---')
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index f20ba86..d5709bb 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -574,7 +574,7 @@ def save_as_quilt(am_msgs: List[EmailMessage], q_dirname: str) -> None:
             sfh.write('%s\n' % patch_filename)
 
 
-def get_extra_series(msgs: list, direction: int = 1, wantvers: Optional[List[int]] = None,
+def get_extra_series(msgs: List[EmailMessage], direction: int = 1, wantvers: Optional[List[int]] = None,
                      nocache: bool = False) -> List[EmailMessage]:
     base_msg: Optional[EmailMessage] = None
     latest_revision: Optional[int] = None
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 82a228d..137d769 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -78,7 +78,7 @@ def git_get_commit_message(gitdir: Optional[str], rev: str) -> Tuple[int, Union[
     return b4.git_run_command(gitdir, args)
 
 
-def make_reply(reply_template: str, jsondata: dict, gitdir: Optional[str]) -> email.message.EmailMessage:
+def make_reply(reply_template: str, jsondata: Dict[str, str], gitdir: Optional[str]) -> email.message.EmailMessage:
     msg = email.message.EmailMessage()
     msg['From'] = '%s <%s>' % (jsondata['myname'], jsondata['myemail'])
     excludes = b4.get_excluded_addrs()
@@ -118,7 +118,7 @@ def make_reply(reply_template: str, jsondata: dict, gitdir: Optional[str]) -> em
     return msg
 
 
-def auto_locate_pr(gitdir: Optional[str], jsondata: dict, branch: str) -> Optional[str]:
+def auto_locate_pr(gitdir: Optional[str], jsondata: Dict[str, str], branch: str) -> Optional[str]:
     pr_commit_id = jsondata['pr_commit_id']
     logger.debug('Checking %s', jsondata['pr_commit_id'])
     if not b4.git_commit_exists(gitdir, pr_commit_id):
@@ -192,7 +192,7 @@ def get_all_commits(gitdir: Optional[str], branch: str, since: str = '1.week',
     return MY_COMMITS
 
 
-def auto_locate_series(gitdir: Optional[str], jsondata: dict, branch: str,
+def auto_locate_series(gitdir: Optional[str], jsondata: Dict[str, str], branch: str,
                        since: str = '1.week') -> List[Tuple[int, Optional[str]]]:
     commits = get_all_commits(gitdir, branch, since)
 
@@ -238,7 +238,7 @@ def auto_locate_series(gitdir: Optional[str], jsondata: dict, branch: str,
     return found
 
 
-def set_branch_details(gitdir: Optional[str], branch: str, jsondata: dict, config: dict) -> Tuple[dict, dict]:
+def set_branch_details(gitdir: Optional[str], branch: str, jsondata: Dict[str, str], config: Dict[str, str]) -> Tuple[dict, dict]:
     binfo = get_branch_info(gitdir, branch)
     jsondata['branch'] = branch
     for key, val in binfo.items():
@@ -269,7 +269,7 @@ def set_branch_details(gitdir: Optional[str], branch: str, jsondata: dict, confi
     return jsondata, config
 
 
-def generate_pr_thanks(gitdir: Optional[str], jsondata: dict, branch: str) -> email.message.EmailMessage:
+def generate_pr_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch: str) -> email.message.EmailMessage:
     config = b4.get_main_config()
     jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
     thanks_template = DEFAULT_PR_TEMPLATE
@@ -298,7 +298,7 @@ def generate_pr_thanks(gitdir: Optional[str], jsondata: dict, branch: str) -> em
     return msg
 
 
-def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, since: str) -> email.message.EmailMessage:
+def generate_am_thanks(gitdir: Optional[str], jsondata: Dict[str, str], branch: str, since: str) -> email.message.EmailMessage:
     config = b4.get_main_config()
     jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
     thanks_template = DEFAULT_AM_TEMPLATE
diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index 796bf75..af86db6 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -1,11 +1,14 @@
 import pytest
 import b4
 import os
+import pathlib
 import sys
 
+from typing import Generator
+
 
 @pytest.fixture(scope="function", autouse=True)
-def settestdefaults(tmp_path):
+def settestdefaults(tmp_path: pathlib.Path) -> None:
     topdir = b4.git_get_toplevel()
     if topdir and topdir != os.getcwd():
         os.chdir(topdir)
@@ -23,15 +26,15 @@ def settestdefaults(tmp_path):
 
 
 @pytest.fixture(scope="function")
-def sampledir(request):
-    return os.path.join(request.fspath.dirname, 'samples')
+def sampledir(request: pytest.FixtureRequest) -> str:
+    return os.path.join(request.path.parent, 'samples')
 
 
 @pytest.fixture(scope="function")
-def gitdir(request, tmp_path):
-    sampledir = os.path.join(request.fspath.dirname, 'samples')
+def gitdir(request: pytest.FixtureRequest, tmp_path: pathlib.Path) -> Generator[str, None, None]:
+    sampledir = os.path.join(request.path.parent, 'samples')
     # look for bundle file specific to the calling fspath
-    bname = request.fspath.basename[5:-3]
+    bname = request.path.name[5:-3]
     bfile = os.path.join(sampledir, f'{bname}-gitdir.bundle')
     if not os.path.exists(bfile):
         # Fall back to the default
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 1e95263..2a367aa 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -5,6 +5,9 @@ import email
 import email.parser
 import mailbox
 import io
+import pathlib
+
+from typing import Any, Dict, List, Literal, Optional, Tuple
 
 
 @pytest.mark.parametrize('source,expected', [
@@ -14,7 +17,7 @@ import io
     ('badsig', (False, False, False, 'B6C41CE35664996C', None)),
     ('no-pubkey', (False, False, False, None, None)),
 ])
-def test_check_gpg_status(sampledir, source, expected):
+def test_check_gpg_status(sampledir: str, source: str, expected: Tuple[bool, bool, bool, Optional[str], Optional[str]]) -> None:
     with open(f'{sampledir}/gpg-{source}.txt', 'r') as fh:
         status = fh.read()
     assert b4.check_gpg_status(status) == expected
@@ -27,7 +30,7 @@ def test_check_gpg_status(sampledir, source, expected):
     # mailbox.mbox does not properly handle 8bit-clean headers
     ('save-8bit-clean', r'From: Unicôdé', 0, False),
 ])
-def test_save_git_am_mbox(sampledir, tmp_path, source, regex, flags, ismbox):
+def test_save_git_am_mbox(sampledir: Optional[str], tmp_path: pathlib.Path, source: Optional[str], regex: str, flags: int, ismbox: bool) -> None:
     import re
     if source is not None:
         if ismbox:
@@ -72,7 +75,7 @@ def test_save_git_am_mbox(sampledir, tmp_path, source, regex, flags, ismbox):
       ('person', 'Signed-off-by', 'Wrapped Persontrailer <broken@example.com>', None),
       ]),
 ])
-def test_parse_trailers(sampledir, source, expected):
+def test_parse_trailers(sampledir: str, source: str, expected: List[Tuple[str, str, str, Optional[str]]]) -> None:
     with open(f'{sampledir}/{source}.txt', 'r') as fh:
         msg = email.message_from_file(fh)
         lmsg = b4.LoreMessage(msg)
@@ -116,7 +119,7 @@ def test_parse_trailers(sampledir, source, expected):
     ('bare-address', {}, {}, 'defaults', {}),
     ('stripped-lines', {}, {}, 'defaults', {}),
 ])
-def test_followup_trailers(sampledir, source, serargs, amargs, reference, b4cfg):
+def test_followup_trailers(sampledir: str, source: str, serargs: Dict[str, Any], amargs: Dict[str, Any], reference: str, b4cfg: Dict[str, Any]) -> None:
     b4.MAIN_CONFIG.update(b4cfg)
     lmbx = b4.LoreMailbox()
     for msg in mailbox.mbox(f'{sampledir}/trailers-followup-{source}.mbox'):
@@ -187,7 +190,7 @@ def test_followup_trailers(sampledir, source, serargs, amargs, reference, b4cfg)
      '<20240319-very-long-message-id-that-spans-multiple-lines-for-sure-because-longer-than-75-characters-abcde123456@longdomain.example.com>',
      'encode'),
 ])
-def test_header_wrapping(sampledir, hval, verify, tr):
+def test_header_wrapping(sampledir: str, hval: str, verify: str, tr: Literal['encode', 'decode', 'preserve']) -> None:
     if ':' in hval:
         chunks = hval.split(':', maxsplit=1)
         hname = chunks[0].strip()
@@ -216,7 +219,7 @@ def test_header_wrapping(sampledir, hval, verify, tr):
     ([('', 'foo@example.com'), ('=?utf-8?q?Qu=C3=BBx=2C_Foo?=', 'quux@example.com')],
      'foo@example.com, =?utf-8?q?Qu=C3=BBx=2C_Foo?= <quux@example.com>', False),
 ])
-def test_format_addrs(pairs, verify, clean):
+def test_format_addrs(pairs: List[Tuple[str, str]], verify: str, clean: bool) -> None:
     formatted = b4.format_addrs(pairs, clean)
     assert formatted == verify
 
@@ -233,7 +236,7 @@ def test_format_addrs(pairs, verify, clean):
     ('-7', 5, []),
     ('1-8', 3, [1, 2, 3]),
 ])
-def test_parse_int_range(intrange, upper, expected):
+def test_parse_int_range(intrange: str, upper: int, expected: List[int]) -> None:
     assert list(b4.parse_int_range(intrange, upper)) == expected
 
 
@@ -248,6 +251,6 @@ def test_parse_int_range(intrange, upper, expected):
     ('[PATCH RFC v3] This is a [patch]', ['RFC'], '[PATCH RFC v3] This is a [patch]'),
     ('[PATCH RFC v3 2/3] This is a patch', ['netdev', 'bpf'], '[PATCH RFC netdev bpf v3 2/3] This is a patch'),
 ])
-def test_lore_subject_prefixes(subject, extras, expected):
+def test_lore_subject_prefixes(subject: str, extras: Optional[List[str]], expected: str) -> None:
     lsubj = b4.LoreSubject(subject)
     assert lsubj.get_rebuilt_subject(eprefixes=extras) == expected
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 1de2459..68fd27b 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -5,9 +5,11 @@ import b4.ez
 import b4.mbox
 import b4.command
 
+from typing import Any, Dict, Generator, List, Optional, Tuple
+
 
 @pytest.fixture(scope="function")
-def prepdir(gitdir):
+def prepdir(gitdir: str) -> Generator[str, None, None]:
     b4.MAIN_CONFIG.update({'prep-cover-strategy': 'branch-description'})
     parser = b4.command.setup_parser()
     b4args = ['--no-stdin', '--no-interactive', '--offline-mode', 'prep', '-n', 'pytest']
@@ -32,7 +34,7 @@ def prepdir(gitdir):
      ['log', '--format=%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread-with-followups-and-tripledash',
      None),
 ])
-def test_trailers(sampledir, prepdir, mboxf, bundlef, rep, trargs, compareargs, compareout, b4cfg):
+def test_trailers(sampledir: str, prepdir: str, mboxf: str, bundlef: Optional[str], rep: Optional[Tuple[bytes, bytes]], trargs: List[str], compareargs: List[str], compareout: str, b4cfg: Dict[str, Any]) -> None:
     if b4cfg:
         b4.MAIN_CONFIG.update(b4cfg)
     config = b4.get_main_config()
diff --git a/src/tests/test_mbox.py b/src/tests/test_mbox.py
index dc41712..aee110e 100644
--- a/src/tests/test_mbox.py
+++ b/src/tests/test_mbox.py
@@ -4,6 +4,8 @@ import b4
 import b4.mbox
 import b4.command
 
+from typing import Any, Dict, List
+
 
 @pytest.mark.parametrize('mboxf, shazamargs, compareargs, compareout, b4cfg', [
     ('shazam-git1-just-series', [],
@@ -13,7 +15,7 @@ import b4.command
     ('shazam-git1-just-series', ['-M'],
      ['log', '--format=%ae%n%ce%n%s%n%b---', 'HEAD^..'], 'shazam-git1-just-series-merged', {}),
 ])
-def test_shazam(sampledir, gitdir, mboxf, shazamargs, compareargs, compareout, b4cfg):
+def test_shazam(sampledir: str, gitdir: str, mboxf: str, shazamargs: List[str], compareargs: List[str], compareout: str, b4cfg: Dict[str, Any]) -> None:
     b4.MAIN_CONFIG.update(b4cfg)
     mfile = os.path.join(sampledir, f'{mboxf}.mbox')
     cfile = os.path.join(sampledir, f'{compareout}.verify')

-- 
2.49.0


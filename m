Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B38C2CA2
	for <tools@linux.kernel.org>; Thu,  2 Dec 2021 23:38:39 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso1022717pjb.2
        for <tools@linux.kernel.org>; Thu, 02 Dec 2021 15:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/73Fj8kV6CEngDOvN7ARtKwVzWTBNBWPci3GT6s2jg=;
        b=biu4M4D/034rb9cszFeDLprh9LySmw5liuiq/QaxD7mqkgyY57oa2eOD1H90DE4EmB
         RkuxDo99LMuwU6OwM+Ep+RMqrTJQvXJiZo0S/rmM6GM+cgGMIEJDTRaMEL7wTK6MhUQO
         y+lzyeciziMbkJLfFaQyIHuOHZI2z8Te2QWq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/73Fj8kV6CEngDOvN7ARtKwVzWTBNBWPci3GT6s2jg=;
        b=D4Zvav76BQ4J7sPohUqp22g4d/TOPjaCdHtk2icOwXmjoSQNwNGcFalS2HzXN1Chvv
         wf8hktT4qtS7XLz75AtxmtZG6eQ2GIx8beRisaUXYJWFsr/WdF05NCLHRzgUz5ARY/sN
         l9qwX1wLHmKVk4X1h7FbWOBrqEMGfhZfcpOIU0KrkdjlCSVg6UJiaL657dP+GNVxT1Yw
         TjE7coyzsll8qhlYDan+FljMflut11ikr0x6JNgPxNMumOi8ml3b6Fs5sfjiPxMn4UaG
         6/hTJz37Aavs6IGLrRNkP3IFVKstgu/pi4ySO8GmW3pQ81pHR+ZGvv/jL5O5jtNobLSD
         7clQ==
X-Gm-Message-State: AOAM532Lby4OC9YSQAt0r8ipEJQt3DdvJJ1kwdyIzI0gaEWHhw758YaR
	cbpXV+Z7e9AMeCXz8YrSaFH5VA==
X-Google-Smtp-Source: ABdhPJyLzUmkLo3VfWVS6rW652XAlh0nj2jhLsf8DkrbYP3a6Xfem5OFPe4raAi7fWtHf4GIUilNTQ==
X-Received: by 2002:a17:902:b411:b0:143:6fe8:c60e with SMTP id x17-20020a170902b41100b001436fe8c60emr18668707plr.41.1638488318709;
        Thu, 02 Dec 2021 15:38:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 16sm573621pgu.93.2021.12.02.15.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 15:38:38 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 2/2] patchwork-bot: Add --pwhash for debugging
Date: Thu,  2 Dec 2021 15:38:36 -0800
Message-Id: <20211202233836.2024510-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211202233836.2024510-1-keescook@chromium.org>
References: <20211202233836.2024510-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; h=from:subject; bh=/h12iYkGuAjtoZBLjF5dQQrXIyCDfnCdl8yfaeO7Iv4=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhqVj7euXN7Mg6ckMciiI5Ilh3FJoMrn2IBS761P9Q oMHHrCeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYalY+wAKCRCJcvTf3G3AJrgDD/ 9Fxj0mU+HFPa3y/gdMziRIqe8jP3VEjexiKQESmJpalueQS9oc/1v3xfdh5FbFnUfL3UVuCdXNt25o LO4blgo6cMnwUfgaZfgC2emfeadZFFxDaasoQgeD8flTbNblTIu3N1UoSmL83QsDwXUqB7pX2EqwG6 DQ6k0jvhfqImvMo0We4Kz8paVEB2TYdZTGsrAoALZwqA9rd7/fsLvX22KOMIidDQiynipOjOK6djZr vFg8opnbInFZnyB+gMaWeSLzUPc68ED/rGtZIbOeNQmfS2XiTbq+UicaBO6shrg11TOsGxbBShjp0e khKce6BFzMfa2q3kI3RJs1mEnmWrPiq855RHonOddx/gYKsG3cWm63YJsO7eKcw72VGO8cSOoiT2Ib ePPqL9ksR5Zi+EUtaajb/OQWAZMqVkRtiuKpDfoLnocSyjRnSOvsHTkvoP4MsyjU58zHvxa6Q0P1jp QvOxYKAV8BMnWPeLAl25GeFqZGBV9L75ykY9ImnLSRNn+CX+Au0fn97AYxddLFKrsu0GH+vAwXlhER 6NWvNGqZIr3cA5v5tBaHQuAu2xyens5mDg5af0ScHlTjEgn91rdje9o9Jqm6BTBEoT8P1iu1PBMDqg HRgD6es4ji9ttFnXJhY33KQmTD62cU8yMRo93Mr7QyKlDOQhN3mXHCrjnReQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Finding a 2-character whitespace difference between patches with different
patchwork hashes strained my sanity, so I want to keep the tooling I
built to track it down. Using "--pwhash PATCH-ID", patchwork-bot will
compare the given patch in patchwork (and its hash) against the diff
from stdin (and its hash).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 git-patchwork-bot.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/git-patchwork-bot.py b/git-patchwork-bot.py
index 4e10385de629..980928cf7b60 100755
--- a/git-patchwork-bot.py
+++ b/git-patchwork-bot.py
@@ -1363,6 +1363,8 @@ if __name__ == '__main__':
                         help='Domain to use when creating message-ids')
     parser.add_argument('--ancestors', default=None,
                         help='During initial database creation, consider this many ancestor commits as fresh')
+    parser.add_argument('--pwhash', default=None, type=int, metavar='PATCH-ID',
+                        help='Debug pwhash mismatches. Compare patchwork hash of diff from stdin to patch id')
 
     cmdargs = parser.parse_args()
 
@@ -1411,6 +1413,24 @@ if __name__ == '__main__':
     if not os.path.isdir(CACHEDIR):
         os.makedirs(CACHEDIR, exist_ok=True)
 
+    if cmdargs.pwhash:
+        diff = sys.stdin.read()
+        pwhash = get_patchwork_hash(diff)
+        print(pwhash)
+        for pw in CONFIG['patchworks']:
+            print(f"Patchwork: {pw}")
+            for pname, psettings in CONFIG['patchworks'][pw]['projects'].items():
+                print(f"Project: {pname}")
+                project, rm, rpc, pconfig = project_by_name(pname)
+                project_id = project['id']
+                print(get_patchwork_patches_by_project_id_hash(rpc, project_id, pwhash))
+                print('-------')
+                p = rm.get_patch(cmdargs.pwhash)
+                pwdiff = p.get('diff')
+                print(pwdiff)
+                print(get_patchwork_hash(pwdiff))
+        sys.exit(0)
+
     if cmdargs.housekeeping:
         for _pserver, _sconfig in CONFIG['patchworks'].items():
             for _pname in _sconfig['projects']:
-- 
2.30.2


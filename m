Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183331868
	for <tools@linux.kernel.org>; Sat, 15 Apr 2023 19:31:21 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id fv6so8986546qtb.9
        for <tools@linux.kernel.org>; Sat, 15 Apr 2023 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681587081; x=1684179081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uMVTnkWahtCHhlqnepki3K4OYKRJPBqyXo3m+29M1A=;
        b=BrUAuLhOHxvNR6sv1MdNH0kk8zVY5zQ36vR4kn2G0W7jJ1JoOKv913+EE7G+8Kyq+t
         CQSIL9DaYJEMpiV7mK38Vjl0HJZC54eh14PEFOUrgCc4H1XGmGQTdlcfNnBQzTZDiHCg
         AVdWLAK7PINCpI8vdrh4ZvG0rwDsnRQy3b863Zenu3JP4YlBYWm43QcmcYSOCHOOHpcj
         d0TwJ9lzDy5siPCPzFfYvxcaD7gbhr5Qn1fctuW79MQwucJ+vZMaVHj0/nKFqkDw127T
         FecVHVgAVPeU0foglwC+HqoJT2ldfWf4VdrIGiQlcJiFl3PL4pSly9oZpXpGSdAqHhio
         ayfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681587081; x=1684179081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uMVTnkWahtCHhlqnepki3K4OYKRJPBqyXo3m+29M1A=;
        b=MIaM+1Jy9P0fVS4ohiDo+4/NTYjQRY+NXpPLEurqOZS3YGeI9VuzARjZl4cTL+X403
         fXOxRD3JDJaOfgl5cRMYwiN9rEwMZmACx6trk/b6PqV8I4BUmH6VuvoaWL7ebYE/YGAU
         AJcAImSWil3uQqZAkp7B3lsNBU0Dw1o4bgXTlQ9ux8DxcWryWySdr6sDp9r2o6SI8iWV
         UBP+DhaApfalw33TiS1wQAqHtILXHpQAAqxmmE67c22YQyW+5CPY5i8lZT5NF/X8S/ik
         pGGnnxuMciUFOrNBDw4szoyk5paW8RcWW70g1PJXCyz1oZEzeSuEcUTjD0ive7Yyz3HR
         aX/Q==
X-Gm-Message-State: AAQBX9d3AQQ5nZq3IK0eXImNDTnns2XV8WtMGRDcVMXLK5UavqOGFFDq
	jOaDTV7ESukJTud4VqD13ZA=
X-Google-Smtp-Source: AKy350bCXbUuY3/3QWEb7QWcOSBEp2spHZyI56jVf6Lut83QvmO91tLu9t9+dath09nq/vQxwrNbtg==
X-Received: by 2002:ac8:7f8c:0:b0:3e8:fe33:4415 with SMTP id z12-20020ac87f8c000000b003e8fe334415mr16553025qtj.11.1681587080803;
        Sat, 15 Apr 2023 12:31:20 -0700 (PDT)
Received: from [127.0.0.1] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id f21-20020ac859d5000000b003e38f7e4562sm2086707qtf.69.2023.04.15.12.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 12:31:20 -0700 (PDT)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Sat, 15 Apr 2023 15:31:00 -0400
Subject: [PATCH b4 2/2] am, shazam: allow cherry-picking an out-of-series
 patch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230415-am-cherry-pick-suggestion-v1-2-8951a2274256@gmail.com>
References: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
In-Reply-To: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.13-dev-c01b1

Reviewers sometimes include a patch as a reply when reviewing a
contributor's series, for example, to suggest tweaks or additional
changes. The contributor might want to add that patch to their series
for the next revision.

Currently, using 'b4 shazam -P_ $msgid', where msgid is the message-id
or full URL of the reviewer's message, does not work:

    $ b4 am -o- -P_ ZDnCMegeiw0kT5oj@nand.local
    Analyzing 2 messages in the thread
    No patches found.

mbox.py::make_am returns early because the LoreSeries 'lser' returned by
lmbx.get_series is empty ('None'). It is empty because when using '-P_',
b4::retrieve_messages only retrieves the specific message-id given (and
its replies), so the LoreSeries 'lmbx' created in make_am does not have
any series.

Also check if the user asked to cherry-pick a specific message-id before
returning early in make_am. This allows us to reach the 'if
cmdargs.cherrypick == '_'' condition, but then we iterate on
lser.patches to find the patch to cherry-pick, and so get a runtime
error:

    $ b4 am -o-  -P_ ZDnCMegeiw0kT5oj@nand.local
    Analyzing 2 messages in the thread
    Traceback (most recent call last):
      File "/Users/Philippe/Code/b4/b4/command.py", line 381, in <module>
        cmd()
      File "/Users/Philippe/Code/b4/b4/command.py", line 364, in cmd
        cmdargs.func(cmdargs)
      File "/Users/Philippe/Code/b4/b4/command.py", line 91, in cmd_am
        b4.mbox.main(cmdargs)
      File "/Users/Philippe/Code/b4/b4/mbox.py", line 719, in main
        make_am(msgs, cmdargs, msgid)
      File "/Users/Philippe/Code/b4/b4/mbox.py", line 82, in make_am
        for lmsg in lser.patches[1:]:
    AttributeError: 'NoneType' object has no attribute 'patches'

Fix this by creating a fake LoreSeries and adding to it any followup
messages in 'lmbx' with a diff in the body.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/mbox.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index 05c40e9..70b866f 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -57,7 +57,7 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
         reroll = False
 
     lser = lmbx.get_series(revision=wantver, sloppytrailers=cmdargs.sloppytrailers, reroll=reroll)
-    if lser is None:
+    if lser is None and cmdargs.cherrypick != '_':
         if wantver is None:
             logger.critical('No patches found.')
         else:
@@ -70,6 +70,13 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
     if cmdargs.cherrypick:
         cherrypick = list()
         if cmdargs.cherrypick == '_':
+            # We might want to pick a patch sent as a followup, so create a fake series
+            # and add followups with diffs
+            if lser is None:
+                lser = b4.LoreSeries(revision=1, expected=1)
+            for followup in lmbx.followups:
+                if followup.has_diff:
+                    lser.add_patch(followup)
             # Only grab the exact msgid provided
             at = 0
             for lmsg in lser.patches[1:]:

-- 
2.39.1


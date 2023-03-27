Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC8A29
	for <tools@linux.kernel.org>; Mon, 27 Mar 2023 10:20:45 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id ek18so33847567edb.6
        for <tools@linux.kernel.org>; Mon, 27 Mar 2023 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1679912444;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKoxwlYpY1M3GFAopGUG/2U9pz7WOXuVtidYl2iYZBs=;
        b=d4MOFVllG82mgnoWnzLRs9jw3pwXqh2BMxyNksMFTe1MgHLpIUYM7rb2zzZ3yAYFaP
         cv2GNSEfRW1KHr93P0IIwwmC/IVMeDi1DlKzYVmtuT7+yMY+d4VqsOFLJ9DFrunmZNKh
         1EAaq8N8f8b3UkjP86pZg5apCvl3Tfmp71PZP1+x4yOX0y/Dp/qAAqJsiwGy58roVafr
         ZHM+KBmm7FPguiHlbirLZ2resGuoUHcgl1X0QZssh9KGKMiQ7ntVPBxC6pvyRiWOMMDJ
         ln6bYu9UppjCTHANFkJD2PSodNO9+jMUN2oVEfd+MiR13jbu3mwvdGSq5XR7E5IM8wyP
         ci1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912444;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LKoxwlYpY1M3GFAopGUG/2U9pz7WOXuVtidYl2iYZBs=;
        b=bfCdf9kOaeLO7m5F/1ZRylvH0R106s5PU/5wV2sEQY2RflwuCMNjmCumsW20EUCqM8
         yU2YnzGrjRHM7Ykt4phbpGhsSB1gyYoWmWOK7hGO2P1vbhMeO0SXo96MX0j5CnsVIQEy
         FrWwK3eVF+BHaNm3u/jbJRDuvZJaKFkLCSTbifZlPNAb0fwne4sTsNZ/LuMDMgTH53ve
         XdwX2TPdDIEShtt3MNsEVXh3Ilfk0CCP5zxPkBcG9LwPHE7m+rF9RB2AaoHetETa6lo4
         6Wk2AL5rvpoUptecT209xMjhMo8+piU8/OiSjDzdw5nf8cuPH6BxQnxMPG9PGugqxlxW
         smjA==
X-Gm-Message-State: AAQBX9dAEzPgvrmG5mwHXoj2agpHN+OAQ9d1RB6NrRCU65u42EavHbmT
	e0o6D3hwhIyCIHnu4IImquwb2w==
X-Google-Smtp-Source: AKy350ZaUOU7ruQ7guqMfO4ZHVEpvAI20J3/m5CMudV6lKdxH4Ihzpv/5BVD8+PlnMdecb4SbAef8A==
X-Received: by 2002:a17:907:11cf:b0:93d:7ad:a954 with SMTP id va15-20020a17090711cf00b0093d07ada954mr11740729ejb.37.1679912444043;
        Mon, 27 Mar 2023 03:20:44 -0700 (PDT)
Received: from [10.44.2.5] ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090629c400b0092fdb0b2e5dsm13989473eje.93.2023.03.27.03.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:20:43 -0700 (PDT)
Message-ID: <9a4ebcd9-9d23-f525-cedd-222970f1b207@tessares.net>
Date: Mon, 27 Mar 2023 12:20:43 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tools <tools@linux.kernel.org>, Christian Brauner <brauner@kernel.org>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: b4: send: support git notes per patch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

Do you think "b4 send" could attach the "git notes" to the different
patches being sent, similar to what "git format-patch --notes" does?

Personally, I find this quite useful: when you have a series with a
bunch of patches, it seems interesting to put a detailed changelog per
patch instead of putting everything in the cover-letter. It makes even
more sense when some people are only Cc with a few patches and not with
the whole series. I didn't find a way to do that with b4.

But then, I guess we might need a workaround implemented or shipped with
b4 to preserve the notes when git filter-repo is used, no? This is
linked to the issue reported by Christian:


https://lore.kernel.org/tools/20221122185249.733ipcpwpgkh5xle@meerkat.local/
  https://github.com/newren/git-filter-repo/issues/22

I guess this issue is not going to be fixed soon and even if it does, it
might take time to have it in the different distros. I admit it is quite
surprising to no longer see the notes after having used b4
prep/trailer/send! :)

Cheers,
Matt

PS: by chance if you can have a look at my patches/questions for 'b4
prep --fork-point', that would be nice :)


https://lore.kernel.org/tools/20230206-b4-prep-fork-point-as-base-branch-v1-0-2732e0c32f5d@tessares.net/
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net

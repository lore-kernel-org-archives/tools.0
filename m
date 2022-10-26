Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E941374
	for <tools@linux.kernel.org>; Wed, 26 Oct 2022 13:02:01 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id bb5so9749805qtb.11
        for <tools@linux.kernel.org>; Wed, 26 Oct 2022 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZqIpk6NPlNg4JGN20EYcRYGs7QFPoltXDwTTI2RmL8=;
        b=OXaVrI1d3H+I4nPE6tDqKCS4G72V1iD9aKC8Tmb1uWO/qHrlKckiZ0oif9ZtOUfssL
         HzlOIOs5zL6PAEfW9ZXLdDrgbRxvXFWuEy6TSm3BujfeUmAVdUq6HKI5I5A5VdUarKGp
         BWxSCAM14f18z0oVKX+TpdcITTB+hlP92Ewdv5SS/XRLaIHwiFUPw5OcOH5FT9ZP09Qv
         +2u3xdvFHO174CqkJzqLKpX75An1fL4Raz8n/OyQOAho042fOTYdCQDJ/87SrDwXvreM
         FpsWkufP0A8JQcEt+beeC0LXOvJcsef5emw14+xtqDuNWmhyt38pMt88h52GvinLGyu1
         o/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZqIpk6NPlNg4JGN20EYcRYGs7QFPoltXDwTTI2RmL8=;
        b=Un8ckTG/gbu4tBknMZsUdK9GcHauAVCpTIVTyYBeYloCoXN47ohmDIdoHFD1rPuW1D
         J8ia7mtSUAbu5i5OARZJkrCBkbM0C5zmTNH6NjL5w5zJstfbEG0MQpZKN01V72mIchOU
         nKYS5cZZltJjLq5CL46CLz4RvvE7NxkSi8IbeJ1IkcQLiJ/5qmzbz4ksl/GwabnoEtro
         oYGic59185uVH4vrcdtiNB+n2iiHDYUqIjKpQzLadHip5oKzD1C3IaDDelNVU8s+oinM
         gfFB+GenEB8bpVTPL5a7r/VCKlOR8Ur6s7KSVdNosBiYobdl/NJZSBQj0Ap1X57niuQP
         n7FA==
X-Gm-Message-State: ACrzQf26OYGnUi9s2Xl1YsS4F534UBBGWw4stvWqGZe4zIU3iIUyXLP7
	hlwneD92jv1IsT914UrI2J7nE61qaBY=
X-Google-Smtp-Source: AMsMyM4Dak0Cjk2KKzOl8Aa23ljTnqRBptKt5ppYwYqdmwLHr1CbZTbb6WsTWuR+vngg5uEsIGqaow==
X-Received: by 2002:ac8:57d0:0:b0:39c:f3a8:7c78 with SMTP id w16-20020ac857d0000000b0039cf3a87c78mr36458468qta.470.1666789320123;
        Wed, 26 Oct 2022 06:02:00 -0700 (PDT)
Received: from [192.168.1.127] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id k7-20020ac80747000000b00398313f286dsm3085858qth.40.2022.10.26.06.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 06:01:59 -0700 (PDT)
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: b4 can't diff a series with a file renamed, then modified
Message-ID: <e759026c-4f49-cc2a-7885-10b88212d20e@gmail.com>
Date: Wed, 26 Oct 2022 09:01:58 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 7bit

Hi Konstantin,

I'm hitting a bug when running 'b4 diff' on https://lore.kernel.org/git/pull.1321.v2.git.git.1666297238.gitgitgadget@gmail.com/.

Here is a reproducer in a clone of git.git:

git checkout 9bf691b78c # the base commit of v1
b4 am -v 1 -o- https://lore.kernel.org/git/pull.1321.v2.git.git.1666297238.gitgitgadget@gmail.com  | git am # apply v1 to get the necessary blobs
b4 -d diff -C -n https://lore.kernel.org/git/pull.1321.v2.git.git.1666297238.gitgitgadget@gmail.com/

This is on b4's 2a16f70 (am: ignore base-commit info if commit not present, 2022-10-19).

The 'b4 diff' command errors like so:

    Looking at [PATCH 3/6] t5617: drop references to remote-tracking branches
    ERROR: some patches do not have indexes
           unable to create a fake-am range
    Running git --no-pager worktree remove --force /var/folders/lr/r6n2057j0dzd4gdb614fp0740000gp/T/tmp7hpz_ac1
    ---
    Could not create fake-am range for lower series v1

I looked through the code and found that LoreMessage::get_indexes
is not ready for rename patches, since the "rename" lines in the 'git diff' output
is placed between the 'diff --git' line and the 'index' line, which the code does 
not account for. This seems to help:

diff --git a/b4/__init__.py b/b4/__init__.py
index 4456414..fb618c7 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1517,7 +1517,7 @@ class LoreMessage:
             if line.find('diff ') != 0 and line.find('index ') != 0:
                 continue
             matches = re.search(r'^diff\s+--git\s+\w/(.*)\s+\w/(.*)$', line)
-            if matches and matches.groups()[0] == matches.groups()[1]:
+            if matches:
                 curfile = matches.groups()[0]
                 continue
             matches = re.search(r'^index\s+([\da-f]+)\.\.[\da-f]+.*$', line)

With this change, the 'b4 diff' command goes a little further, but still fails:

    Running git --no-pager write-tree
    Running git --no-pager commit-tree 565d875b4fdf449501853a9bcbe608e4374d9eed^{tree} -F -
    Running git --no-pager reset --hard 1149ea03d905ba0a51d1c80e6352361cf34feee1
    Running git --no-pager am .__git-am__
    ERROR: Could not fake-am version 1
    Running git --no-pager worktree remove --force /var/folders/lr/r6n2057j0dzd4gdb614fp0740000gp/T/tmp1h_x78kk
    ---
    Could not create fake-am range for lower series v1

I ran the 'git am' command manually in the temporary worktree, and this is what it outputs:

    $ git am .__git-am__
    Applying: clone: teach --detach option
    warning: t/t5601-clone.sh has type 100644, expected 100755
    Applying: repo-settings: add submodule_propagate_branches
    Applying: t5617: drop references to remote-tracking branches
    warning: t/t5617-clone-submodules-remote.sh has type 100644, expected 100755
    error: t/t5617-clone-submodules.sh: already exists in index
    Patch failed at 0003 t5617: drop references to remote-tracking branches
    hint: Use 'git am --show-current-patch=diff' to see the failed patch
    When you have resolved this problem, run "git am --continue".
    If you prefer to skip this patch, run "git am --skip" instead.
    To restore the original branch and stop patching, run "git am --abort".

It aborts at 3/6 because t/t5617-clone-submodules.sh (the new name of the renamed file)
already exists in the index. From what I understand of LoreSeries::make_fake_am_range, this
is because it gets added to the index when preparing the initial fake commit because
6/6 modifies it.

Thanks,
Philippe.

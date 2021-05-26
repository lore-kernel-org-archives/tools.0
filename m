Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD82FAE
	for <tools@linux.kernel.org>; Wed, 26 May 2021 19:26:01 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id w9so1344168qvi.13
        for <tools@linux.kernel.org>; Wed, 26 May 2021 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=Ihbc3u5aew2lSQcf2krElyPnbKLjcAVLyueARIchcLU=;
        b=B3VR9LTgqBSBq7FRrpNvWXDOTDWR8Z5C+xcqazXurU8BqNdeeIQglvXl4aqmWLDOTt
         aAxCTVGt4xCHN7WXgg8DXlzPWU436McspLlZ+OF1neiTyp7X5PRMQE/BkcBweoxx5mpD
         rPIuiP5njkXN/3cK9ijSR9MSdcROiSCE6+6Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=Ihbc3u5aew2lSQcf2krElyPnbKLjcAVLyueARIchcLU=;
        b=pFmaeCxCkuF7rsxmVIo3c51RXiuxDRxdxrB0qGJjuT7mHBRW23xBRJmbpGHLsf7NQO
         JghQpz7zv3W3LYX+RCO1hH3tpE+AEi+Xvbbt2uMXH/XFySDa6uq4WgY805ouHA3D9Ahp
         xwQJes/ijYN+u326gtB0f0GMiLeEUxm3SnSifliuZjvC7XKD6jRsG3gHArBz6FKZBMUg
         GRJppOWEW4pV4jzLPa7AwUzayPiRcZzLDTpbFVrdYDgFTgs6SrUE+SUM80p6JVuA21+U
         0goHMtUDoqz4I39WGQRSquv2q2gVIn3L5tDHQeSeCGzUHGEqR48E3SCPxueUftyi36sW
         3i6w==
X-Gm-Message-State: AOAM531i8vnGGlUTrlYlATk8SuBE+hdKucFOYalXq+UigIJjbqk4sVpC
	9eabuXTi9AKf/v00OJDyHTOLqrNhbOf4rUFAc5A=
X-Google-Smtp-Source: ABdhPJxiQreYlCZzUVL3q1frDPFIGN2/lSCjeX427+jSlP/1wyyJ8J6iX7ewNK85OH6ej/pDuMKi8A==
X-Received: by 2002:ad4:466c:: with SMTP id z12mr45475715qvv.14.1622057159857;
        Wed, 26 May 2021 12:25:59 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id v18sm2158672qkv.34.2021.05.26.12.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:25:59 -0700 (PDT)
Date: Wed, 26 May 2021 15:25:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: b4 v0.7.0 is available
Message-ID: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello, all:

Version 0.7.0 of b4 is now available for use. This release includes mostly
backend changes, but also includes some fixes and adds some oft-requested
features.

# Upgrading

If you've previously installed with pip:

    pip install --user --upgrade b4

If you're using b4 from a git checkout:

    git checkout stable-0.7.y
    git submodule update --init

# What is new

Below is the summary of what is new.

## Patch attestation

This version includes what I hope is the final rewrite of patch attestation
features, which has largely moved into its own tool and library called
"patatt": 

    https://pypi.org/project/patatt/

Patatt allows for end-to-end cryptographic attestation of patches via a
separate X-Developer-Signature email header that is very similar to DKIM. If
you have an hour, you can see my presentation to OpenSSF Digital Attestation
WG here:
https://www.youtube.com/watch?v=no6r1iUqY1A

B4 will check for this header in the messages it retrieves and will invoke
patatt (if found) to perform the attestation check, e.g.:

    $ b4 am -o/tmp 20210521184811.617875-1-konstantin@linuxfoundation.org
    [...]
    Checking attestation on all messages, may take a moment...
    ---
      ✓ [PATCH 1/3] Sign Message-Id header if present
      ✓ [PATCH 2/3] Make header order deterministic
      ✓ [PATCH 3/3] Release as 0.4.0
      ---
      ✓ Signed: openpgp/konstantin@linuxfoundation.org
      ✓ Signed: DKIM/linuxfoundation.org
    ---
    [...]

It is very easy to start signing patches with patatt, so I invite everyone to
test it out. If you are using git-send-email, you can automate the whole thing
to happen behind the scenes via the sendemail-validate hook:
https://pypi.org/project/patatt/#getting-started-as-contributor

If you've been using "b4 attest" for this purpose, you can continue to do so,
just make sure that patatt is installed (it will be automatically pulled in
with pip, or you can "git submodule update --init" if you're using straight
from a git checkout).

## Mailbox and maildir output changes

While troubleshooting some odd DKIM failures, I've discovered that what Git
considers "mbox" and what Python considers "mbox" are two different things,
which resulted in some wrongly escaped ">From" sequences to end up in commits,
as is evidenced here:

    https://git.kernel.org/torvalds/c/137733d08f4a

Starting with version 0.7, "b4 am" will save .mbox files in the format that
git expects. Alternatively, you can set "b4.save-maildirs=yes" or pass -M to
save threads as maildirs, which are also natively supported by git and avoid
any possible ambiguities when it comes to escaping/parsing mbox files.

You can read my full rant about the problem here:
https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=4950093c0c3

## Partial-reroll support

This version of b4 will automatically recognize partial series rerolls, e.g.:

    [PATCH v3 1/3] Patch one
    [PATCH v3 2/3] Patch two
     \- [PATCH v4 2/3] Patch two revised
    [PATCH v3 3/3] Patch three

When we see a new revision show up mid-thread, as a child of another patch
with the same numbers, we will automatically generate a new revision, so
retrieving the above thread with b4 will correctly generate a v4 with reused
patches 1 and 3 from v3:

    [PATCH v3->v4 1/3] Patch one
    [PATCH     v4 2/3] Patch two revised
    [PATCH v3->v4 3/3] Patch three

You can disable this for a thread by passing --no-partial-reroll to b4 am.

## Other small fixes

- We will now do a better job parsing [various] [bracketed] [things] in the
  subject.

- Cherry-picking with -P_ does a better job finding the message you want
  regardless of where it is in the thread.

- You can now pass an mbox via stdin using "b4 am -m -", so now you can use
  "b4 am" as a complete pipe-through from mutt to git am. This is handy for
  offline operations. See here for more detail:
  https://lore.kernel.org/tools/20210517220151.b2bmt5f2jjlgmkos@nitro.local/

- b4 am will warn when it finds a message in the thread with an
  "Obsoleted-by:" follow-up trailer. Running "git am -c" will automatically
  retrieve the linked revision, so contributors can now follow-up to the
  obsoleted revisions by sending a follow-up reply with:
  Obsoleted-by: https://lore.kernel.org/r/new-revision-msgid

- b4 pr --explode can now generate archive-ready threads, including a gzipped
  mbox of all discussion threads linked from commits. This feature is mostly
  for the archival project on the kernel.org side of things.

# Acknowledgements

Special thanks to the following people who helped during this release:

- Kyle Meyer 
- Peter Zijlstra
- Dan Williams
- Morten Linderud
- Mark Brown

Best regards,
Konstantin

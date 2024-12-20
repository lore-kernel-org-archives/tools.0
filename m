Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C33207A1D
	for <tools@linux.kernel.org>; Fri, 20 Dec 2024 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708875; cv=none; b=a9BjLX8kVNIknzlwqeIJGsELZzbIXBUWGEfSK0fGjo55gTshBFksxK01zIv1egJ2OD8nuZfkJHr0wju+FhVxYwnMNfAZIYocD/whtBYxODHNVaCT4Ks/7KC//+FIQfmm6iZ5QhR1GK2OzUxlPTwS0eNXTo8vMaIFbvHbSR85TVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708875; c=relaxed/simple;
	bh=o6VUqpvLuBQB2PuOrdO017+0q0D/ZsP5aIFYsizM3og=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qoKaHZAJBLeHs+Ur/lkA0jNi9e7xIjSUdBcKlbhaq602opAPcetSS/m8iwAi2b0MjDAFAytb5cAeTc83ay6MIcApo1n2DJc0L4NiBoB6Z9iMAWS0rz9flIrnqkB7HUk3F5QDbJi6y7inQTFvxAGpEldd73OM9RC+0I+eK/gqrhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2QbGRctE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2QbGRctE"
Received: by smtp.kernel.org (Postfix)
	id 479ACC4CED3; Fri, 20 Dec 2024 15:34:35 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C0F5C4CECD
	for <tools@kernel.org>; Fri, 20 Dec 2024 15:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C0F5C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467abce2ef9so294071cf.0
        for <tools@kernel.org>; Fri, 20 Dec 2024 07:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734708872; x=1735313672; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1lPXyjaf345uNsjzFYHc3gGML2pFWEIj5bTrh9lJWag=;
        b=2QbGRctE0PZJdTvtoNkqM5+cmLKtFhhDiUiUpMJagQ5Ypy0KJ4jkwLo0QicQA0G0bP
         pxYQ8mHe9hd9mwJmV/jMdL/aM1HGn7W8uBCFNzc3dnMsP5e2UiqED44OidiviPU/7Ikd
         /jN6J3rkKpbIOM2M1XIZfHWLEmGZ6c+oE8kPPcB5oQzZRefn4ok28rKSdWUxnO1XbkqM
         fzuIMvcR7xGF5NOunRglDfMzgGRq9oH8yMY8yBwLdsSri9YLEehD7WxCdbwD/tuTbA+T
         w5kQvmqw8YuamzcgHn13f9aozu4uLu8zoP6y87ikuVHaRe7vZSeZ3Br4W6aIZ/pno6eh
         uqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708872; x=1735313672;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lPXyjaf345uNsjzFYHc3gGML2pFWEIj5bTrh9lJWag=;
        b=jZm+/x6fPOg0Hwp59YbJTbY6eavQ1ClseW8/blNt9AkU2qNNt7EL8JCSOleJDgtEeK
         V+NiO9pgDQVgMmLmrpxDcMDPXRy4YP71HNCP4wVTjqydfcF9GK2RNQUOsixqOzmUrMHD
         6p2yI2HWQbxd7wFsU31V3juVvt66gYUHkckwQZpEBKEuqcxDwao8y6ZYhVJ1jTvWN8ir
         v60l1u9SHWx9z/HUdS2uN+A02HtCEmWxdCLePH96vmjyuog4CgPQlvYOsTseOL3FDb09
         s3TeqbqonittVv5KQfbzkaeD4By/L5AFGtvVqzVX+Q8F5E1CNY0vD30X6bRtV8vMCown
         W3JA==
X-Gm-Message-State: AOJu0YzskuoStiSO9rGNEqlBWrhVt8rCMenSnhS51nvkID7NTIc+3S7r
	P0+fPH0L2qh58Ca2hWEr9G+isY2iLsD+LIDyWUTnq8VdrOPzo4FGITSqfgvaC6GW21nb85RJ4dl
	RM6y7hbRyWuJQNBV0OBYFiN2Q7K03JBomLFHWHpG6aIqHR9KtbGCxKYem5A==
X-Gm-Gg: ASbGncuTouv2PLE1sjksLGETiqiZG0xQa0EHIoRAupkOGwxSxbza5RnkMpF+cxrBoJs
	GUIsGOV69hDA1zJxwdukCfX1rGV0+GNH5KPI=
X-Google-Smtp-Source: AGHT+IGY47IRKgUpXUaC77/ypFfRBYTYDYhPZLvFZlI4frE0KOpRQpyaDy9Z5iTS8jubqmfTOFVkf95y2tyAlaaEOn8=
X-Received: by 2002:a05:622a:130a:b0:466:975f:b219 with SMTP id
 d75a77b69052e-46a4a8d36b5mr3754761cf.8.1734708872333; Fri, 20 Dec 2024
 07:34:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 20 Dec 2024 15:34:20 +0000
X-Gm-Features: AbW1kvZ5BnI94Zj2bJc3lZDiYClQAjWOa3BpzTNRyVYL5ieYO57r9fJJIBfEUdY
Message-ID: <CA+i-1C2V_wKeP9wUFLkFD7wTyZgBhPfNoVw_bwcfe_C6xs7Kjw@mail.gmail.com>
Subject: assertion failing in git_filter_repo.py
To: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for all the fantastic work with b4,very much appreciated.

Got a bug report: when I run b4 commands that modify the cover-letter
commit, I get this error:

(If GMail messes this up, see below for a link to a clean version).

Traceback (most recent call last):
  File "/usr/local/google/home/jackmanb/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
             ^^^^^
  File "/usr/local/google/home/jackmanb/.local/share/pipx/venvs/b4/lib/python3.11/site-packages/b4/command.py",
line 417, in cmd
    cmdargs.func(cmdargs)
  File "/usr/local/google/home/jackmanb/.local/share/pipx/venvs/b4/lib/python3.11/site-packages/b4/command.py",
line 93, in cmd_send
    b4.ez.cmd_send(cmdargs)
  File "/usr/local/google/home/jackmanb/.local/share/pipx/venvs/b4/lib/python3.11/site-packages/b4/ez.py",
line 2133, in cmd_send
    reroll(mybranch, tag_msg, cl_msgid)
  File "/usr/local/google/home/jackmanb/.local/share/pipx/venvs/b4/lib/python3.11/site-packages/b4/ez.py",
line 2269, in reroll
    store_cover(new_cover, tracking)
  File "/usr/local/google/home/jackmanb/.local/share/pipx/venvs/b4/lib/python3.11/site-packages/b4/ez.py",
line 659, in store_cover
    frf.run()
  File "/usr/local/google/home/jackmanb/.local/share/pipx/venvs/b4/lib/python3.11/site-packages/git_filter_repo.py",
line 4936, in run
    self._record_metadata(self.results_tmp_dir(), self._orig_refs)
  File "/usr/local/google/home/jackmanb/.local/share/pipx/venvs/b4/lib/python3.11/site-packages/git_filter_repo.py",
line 4767, in _record_metadata
    self._compute_metadata(metadata_dir, orig_refs)
  File "/usr/local/google/home/jackmanb/.local/share/pipx/venvs/b4/lib/python3.11/site-packages/git_filter_repo.py",
line 4712, in _compute_metadata
    assert(usoa == intermediate) # old wasn't pruned => usoa == intermediate
           ^^^^^^^^^^^^^^^^^^^^
AssertionError

I'm running on a Debian-testing-based system with git version
2.47.1.613.gc27f4b7a9f-goog. AFAIK the Google modifications to Git are
just adding security stuff, not changing Git's user-facing behaviour,
I do not think that's likely to be the cause.

I bisected the issue to commit 2e024fa130e5 ("send-receive: use our
own emlpolicy when parsing messages"). My EDITOR is /usr/bin/vim.
Maybe the bisection is bogus (e.g. nondeterminism) or maybe this
points to something complicated happening, I'm not too sure.

I dumped the package versions in my pipx virtualenv, plus the error
message in case GMail makes a mess above, here:

https://gist.github.com/bjackman/f2fdd13afaebf7a8ec4a6f14cdcebb89

Any ideas?

Thanks,
Brendan

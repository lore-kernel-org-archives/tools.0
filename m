Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC8E3D811C
	for <tools@linux.kernel.org>; Thu,  4 Jun 2026 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604633; cv=none; b=Dnhu2LHEm3A8yIQJwxyvm/HmmnxOM14ezsdTO6gV8yoCy1MtHEd662hB3MuSUWXUoxS36pvlSNojz69zTi9/TrGpyoSQMesUueEwT4oQeFOsf9pjVd6qR3s7Ye6XiBbQlHyustaSZ2D8Q+p+0B7iuQ8LMtspdKDsXTDhLgDpF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604633; c=relaxed/simple;
	bh=q1YIO+vt4iitQmKdkk7k5yYf65JTxKx27ey3AxbLvn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pDARs14uPaCYTr9+umhtCEjUmySC3hMgyCkVHMrqVMHuCued+H2JD80QM5lreqV9kaRlBThxPSIh2ZyA9L/gGl3EH1hFkdzdHB5df6lHq0sbVcbuWZA8uAzniI4ae5mn076hD4MT/pVdI+oLr47Z88dyh0aptxJG4NrwxMwDijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOY1LROR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOY1LROR"
Received: by smtp.kernel.org (Postfix)
	id 4F5181F00898; Thu,  4 Jun 2026 20:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FA11F00893;
	Thu,  4 Jun 2026 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780604632;
	bh=hB9eGWcWXmo+a7cU8v5KkGaphjXb61prKTaMA+zuoEo=;
	h=From:To:Cc:Subject:Date;
	b=VOY1LRORUkcbFAiUEx+aDjm4vrejVeZ7WLYxa65KPvJLcb4579pX+NZZC6I4bKerY
	 /PBEmPq/CHRWrjUCIYgzGsF9vKz0WIv0fd8J9i/DHjgj30qFofx1SDDxsszKB0s9jK
	 Lb2AN6FC7IjROrHiWDhjqGREgbAlJcHtd7tVmO4zxwNInIIixe9vgBro1YDO6D8E6C
	 QnkOgveESUt6fHxA+8sPAWAarYtwEI2EnSaheGEusBHzEdoUfaMKZ6jHmz8oZFfJNY
	 8Fc9E0vIiuUW2Iy81V8vyxZknST18PDVzj8mvYSbH723W1r3ZPv3GzZnIlHzf7yyxC
	 1GJpQ18fvrOVA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: tools@kernel.org
Cc: konstantin@linuxfoundation.org
Subject: [BUG] b4: assertion error with `b4 send`
Date: Thu, 04 Jun 2026 22:23:39 +0200
Message-ID: <878q8ujbqs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

I got this assertion error when sending patches today:

---
Sent 11 messages
Tagging sent/20250305-unique-ref-29fcd675f9e9-v17
Recording series message-id in cover letter tracking
Created new revision v18
Updating cover letter with templated changelog entries.
Invoking git-filter-repo to update the cover letter.
New history written in 0.06 seconds...
Traceback (most recent call last):
  File "/nix/store/rnbga7cjzjihq8qayhm2fdpq18g49dwm-b4-0.15.2/bin/.b4-wrapped", line 9, in <module>
    sys.exit(cmd())
             ~~~^^
  File "/nix/store/rnbga7cjzjihq8qayhm2fdpq18g49dwm-b4-0.15.2/lib/python3.13/site-packages/b4/command.py", line 512, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/nix/store/rnbga7cjzjihq8qayhm2fdpq18g49dwm-b4-0.15.2/lib/python3.13/site-packages/b4/command.py", line 95, in cmd_send
    b4.ez.cmd_send(cmdargs)
    ~~~~~~~~~~~~~~^^^^^^^^^
  File "/nix/store/rnbga7cjzjihq8qayhm2fdpq18g49dwm-b4-0.15.2/lib/python3.13/site-packages/b4/ez.py", line 2352, in cmd_send
    reroll(mybranch, tag_msg, cl_msgid)
    ~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/rnbga7cjzjihq8qayhm2fdpq18g49dwm-b4-0.15.2/lib/python3.13/site-packages/b4/ez.py", line 2491, in reroll
    store_cover(new_cover, tracking)
    ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/rnbga7cjzjihq8qayhm2fdpq18g49dwm-b4-0.15.2/lib/python3.13/site-packages/b4/ez.py", line 749, in store_cover
    run_frf(frf)
    ~~~~~~~^^^^^
  File "/nix/store/rnbga7cjzjihq8qayhm2fdpq18g49dwm-b4-0.15.2/lib/python3.13/site-packages/b4/ez.py", line 157, in run_frf
    frf.run()
    ~~~~~~~^^
  File "/nix/store/xl7fx5x8g52g03npg1dpjzvaiijpv98z-python3.13-git-filter-repo-2.47.0/lib/python3.13/site-packages/git_filter_repo.py", line 4936, in run
    self._record_metadata(self.results_tmp_dir(), self._orig_refs)
    ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/xl7fx5x8g52g03npg1dpjzvaiijpv98z-python3.13-git-filter-repo-2.47.0/lib/python3.13/site-packages/git_filter_repo.py", line 4767, in _record_metadata
    self._compute_metadata(metadata_dir, orig_refs)
    ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/xl7fx5x8g52g03npg1dpjzvaiijpv98z-python3.13-git-filter-repo-2.47.0/lib/python3.13/site-packages/git_filter_repo.py", line 4712, in _compute_metadata
    assert(usoa == intermediate) # old wasn't pruned => usoa == intermediate


It looks like everything is OK and b4 set up for the next spin, cover
letter looks right.

I observed this on nixos first with b4 0.14.3 via nixpkgs 25.05, then
upgraded to 0.15.2 via nixpkgs unstable.

Best regards,
Andreas


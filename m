Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A972A36A36C
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195005; cv=none; b=dTfFkGWBprvNHRvsF/opsX5q+vd8/RMxr5ToA09aumhk5LO4AGLRmwK6eZ0MInZOXo5bW0qhIs2aCcQ/fAEmQXu+d9KFIdHZrRvCyokEwO7kNgJRMauYeaSyq+KZLY/I/G0HOQZhaF9EH7nWzM6cbPAizTJ6EOxE33o0S0FKfW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195005; c=relaxed/simple;
	bh=hi8lDfqe6WFHiCdc7USVgV6ab2ImjMrmuXnBiEQOyjs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=V3vbNXoVDBarUIh42GglzycyLve63APY53SCr+vxF+5EgyKUjdmKCpjsJEmRQaKITVGrpbDrQB9Mo8YNnUIRhJjSGn4OtvQHk4+4tQzYGoTNkG0Oodz3DQINhoAeql2QEj98eT8zkq93sB8veVdoiQ0NMPLLnKI1vuqiPQLLM7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=auW6WDTf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="auW6WDTf"
Received: by smtp.kernel.org (Postfix)
	id 578F91F000FF; Mon,  5 Oct 2026 10:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F054C1F00898;
	Mon,  5 Oct 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791195002;
	bh=R91TXDIpN66vcA79KJDBoQZLAiwHINCyh5khHzDP32I=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=auW6WDTftDr6uS3mwOutBADGH1RlG0gpsrAi6MWUsYoGT9RhhQsXY9Hz/JoVdgd9g
	 LTQU4EFaRclqxe9ViZukZgaUcStQkYRKFEoSBVuWYVs1vdValcxLDa3XfzLonx2fQz
	 sAsqO6lAmFcygD9tSODpuXqecnsw+lqI6GThYg7Q=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 3/3] lore: stop a less pager quitting on output that
 fits one screen
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260925-b4-lore-fixes-v1-3-103fd9507e67@baylibre.com>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
 <20260925-b4-lore-fixes-v1-3-103fd9507e67@baylibre.com>
Date: Mon, 05 Oct 2026 10:09:49 +0000
Message-Id: <179119498922.1802901.11622089083955121536.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3677;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=hi8lDfqe6WFHiCdc7USVgV6ab2ImjMrmuXnBiEQOyjs=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIOl5ed2vjxX7PTv2cH2cuftap7BWm1LN+zUttzWuax0
 osfb1x83FHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAiLqmMDMdLz6wTaeGrv+1p
 nrjP3H3tjd6nzMwzEi83Rd2btVB84l6G/wVVHZu873J19Jp4vt47UXedqcTllo8lkzafzL77ufR
 RPhMA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> [ ... 32 lines skipped ... ]
>          if '|' in pager:
>              # Pager uses a pipeline (e.g. "diff-highlight | less -RFX"),
>              # so we must use the shell to interpret it.  Feed data on
>              # stdin since piped pagers read from the pipe, not from a
> -            # file argument.
> +            # file argument.  The less inside is out of reach, so F only
> +            # comes off the environment here.
> +            env = dict(os.environ)
> +            env['LESS'] = env.get('LESS', 'FRX').replace('F', '')
>              logger.debug('Running (shell): %s < %s', pager, temp_fpath)
>              with open(temp_fpath, 'rb') as fh:
>                  spop = subprocess.Popen(pager, shell=True, stdin=fh, env=env)
>          else:
>              sp = shlex.shlex(pager, posix=True)
>              sp.whitespace_split = True
> -            cmdargs = list(sp) + [temp_fpath]
> +            cmdargs = list(sp)
> +            if cmdargs and os.path.basename(cmdargs[0]) == 'less':
> +                # less takes its options left to right, so -+F resets
> +                # quit-if-one-screen whichever set it.
> +                cmdargs.append('-+F')
> +            cmdargs += [temp_fpath]
>              logger.debug('Running %s', ' '.join(cmdargs))
> -            spop = subprocess.Popen(cmdargs, env=env)
> +            spop = subprocess.Popen(cmdargs)

Would this cause problems for people who set their less env to different
settings? I'm not sure I'm comfortable blindly appending +F to all
possible less invocations.

>          spop.wait()
>  
>  
> diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
> index 601c0dc..b677b69 100644
> --- a/src/tests/test___init__.py
> +++ b/src/tests/test___init__.py
> @@ -2763,3 +2763,81 @@ class TestFakeAmGitlinkPreimage:
>              ecode, entry = b4.git_run_command(repo, ['ls-tree', commit, 'sub'])
>              assert ecode == 0
>              assert entry.split()[:3] == ['160000', 'commit', gitlink]
> +
> +
> +class TestViewInPagerLessFlags:
> +    """-F has to come off a "less" pager, and nothing else may change.
> +
> +    Output short enough to fit one screen -- a range-diff narrowed to a
> +    single patch, say -- is exactly what quit-if-one-screen flashes past
> +    the reader, and a core.pager of "less -FRSX" carries that flag where
> +    the LESS environment cannot reach it.  less reads its options left to
> +    right, so appending -+F resets it whatever spelling the pager used,
> +    and nothing in the pager's own arguments is parsed or rewritten.
> +    """
> +
> +    class _Spawned:
> +        """Stands in for the pager process, which nobody is here to read."""
> +
> +        def wait(self) -> int:
> +            return 0
> +
> +    @classmethod
> +    def _spawned(cls, monkeypatch: pytest.MonkeyPatch, pager: str) -> List[str]:
> +        """Return the argv view_in_pager() would have run."""
> +        seen: List[Any] = list()
> +        real_popen = b4.subprocess.Popen

This line and the monkeypatch.setattr() below fail ci.sh at the mypy
step (mypy runs in strict mode, so implicit re-exports are off):

    src/tests/test___init__.py:2789: error: Module "b4" does not
    explicitly export attribute "subprocess"  [attr-defined]
    src/tests/test___init__.py:2800: error: (same)

You should just add `import subprocess` to the test imports and use
`subprocess.Popen` / `monkeypatch.setattr(subprocess, 'Popen',
fake_popen)`. It patches the same object, so the behaviour does not
change.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

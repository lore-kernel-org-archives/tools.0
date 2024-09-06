Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0181D1F50
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634035; cv=none; b=ZzBykmpcFzdOsJziaDqhZK4Iw1nWwL39ZuhDwJxSOHkH3VrRuiBTvrIt5VB4vbfkBzfZXk7iqG87KswncfvJrl6/03jycLkPkmfJaFPh/O4lZzTKeELCdnjWhRrSuZWxD1bQMQTnUe57x0QeupQHREodQlcPMvHGcnkvN59tV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634035; c=relaxed/simple;
	bh=A4+Zzc5ft4byi7YCMXwTDhHzcrDqvaJlBBP51KOXB/M=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ttnLa6CGpscTyx/9K9XhSQl69pgMPomzONHNZvOBPgmmH2O8HZHNXU8xVP7RqR503DeifUK/KDANwwAORrf7K5LoMEswHKIJtacJ4Kol9+4SZXNv7m3si+MZLl4RtMRN+hdMGx5eXWPljDLLyaROUEhn+dC6n931gVQNA1kb28k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AxRTbJaK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AxRTbJaK"
Received: by smtp.kernel.org (Postfix)
	id 0A755C4CEC6; Fri,  6 Sep 2024 14:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF335C4CEC8;
	Fri,  6 Sep 2024 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634034;
	bh=A4+Zzc5ft4byi7YCMXwTDhHzcrDqvaJlBBP51KOXB/M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=AxRTbJaKP88W3eceNC6ZrZj1PR1ubfH4W0ngih6Dkz8p1hoDjp6Sfvcx5q+/x4Own
	 M7oUe04Ut3oED5M0MH73AufeG/b4cNQLAfhJe3+M5fwUF+mY21q4IFMz3BndLWUO4r
	 oa38jgOxscJaSzlKzBhJmEg4xv+/CiCu5ZdypyTQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Brandon Maier <brandon.maier@collins.com>
In-Reply-To: <20240626-b4-config-check-cmd-v1-1-83fc971196f9@collins.com>
References: <20240626-b4-config-check-cmd-v1-1-83fc971196f9@collins.com>
Subject: Re: [PATCH b4] Fix prep-perpatch-check-cmd in .b4-config
Message-Id: <172563403468.23316.1406528845988182698.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 10:47:14 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-40f6e


On Wed, 26 Jun 2024 19:34:46 +0000, Brandon Maier wrote:
> Trying to use the 'prep-perpatch-check-cmd' config from a repo
> with '.b4-config' fails. For example as follows
> 
>   $ b4 --version
>   0.14.0
>   $ printf '[b4]\n\tprep-perpatch-check-cmd = "true"\n' >.b4-config \
>         && git add .b4-config && git commit -m b4-test
>   $ b4 prep --check
>   Checking patches using:
>     t
>     r
>     u
>     e
>   ---
>   Traceback (most recent call last):
>     File "/home/blmaier/.local/bin/b4", line 8, in <module>
>       sys.exit(cmd())
>                ^^^^^
>     File "/home/blmaier/.local/lib/python3.12/site-packages/b4/command.py", line 417, in cmd
>       cmdargs.func(cmdargs)
>     File "/home/blmaier/.local/lib/python3.12/site-packages/b4/command.py", line 83, in cmd_prep
>       b4.ez.cmd_prep(cmdargs)
>     File "/home/blmaier/.local/lib/python3.12/site-packages/b4/ez.py", line 2822, in cmd_prep
>       return check(cmdargs)
>              ^^^^^^^^^^^^^^
>     File "/home/blmaier/.local/lib/python3.12/site-packages/b4/ez.py", line 1707, in check
>       ckrep = b4.LoreMessage.run_local_check(ppcmdargs, commit, msg, nocache=cmdargs.nocache)
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     File "/home/blmaier/.local/lib/python3.12/site-packages/b4/__init__.py", line 1522, in run_local_check
>       ecode, out, err = _run_command(cmdargs, stdin=bdata, rundir=topdir)
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     File "/home/blmaier/.local/lib/python3.12/site-packages/b4/__init__.py", line 2650, in _run_command
>       sp = subprocess.Popen(cmdargs, stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     File "/usr/lib64/python3.12/subprocess.py", line 1026, in __init__
>       self._execute_child(args, executable, preexec_fn, close_fds,
>     File "/usr/lib64/python3.12/subprocess.py", line 1955, in _execute_child
>       raise child_exception_type(errno_num, err_msg, err_filename)
>   FileNotFoundError: [Errno 2] No such file or directory: 't'
> 
> [...]

Applied, thanks!

[1/1] Fix prep-perpatch-check-cmd in .b4-config
      commit: d5f395677ea538c12cb2fe055a11d569957bdc67

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B4EC5
	for <tools@linux.kernel.org>; Thu, 23 Jan 2025 17:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737653609; cv=none; b=k1CbvlgIixuRS9emnZK5PPLtD23QAOza/k29Spm0tqqehtg07OKQv/O2YlsXbj8bn99nyMZwP2prhNTGeEVov2MFrDzL/mCPO22zrmmKFBOHTOom6oVOXZJKrJnEB2mLGXA5AMvCpDlCD4xFhAaijuaGNS5b1QKd7FlgMjP6BOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737653609; c=relaxed/simple;
	bh=MnZh0zy1D9kt8EU1CGMf/e0a0J/XCDHo9TniLe3VG1E=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FSGMksyU2dCOLoeXlOnP8QwacyPe9oKFEG3xu5P2ZzOia4ulyeYOOluFIRNT2uSvD7stknFpMXENnD55+P4FjPYvLpF+YPHZnvcz1q6H6USvEHBDR5HHWrJzq0CagoMIBkWautTgCdOPNiNTq8qHelhMjV6VLZghFrJAPiAVIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DXzwDmUx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DXzwDmUx"
Received: by smtp.kernel.org (Postfix)
	id 064D0C4CEE2; Thu, 23 Jan 2025 17:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD3AC4CEE0;
	Thu, 23 Jan 2025 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737653608;
	bh=MnZh0zy1D9kt8EU1CGMf/e0a0J/XCDHo9TniLe3VG1E=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DXzwDmUxcmLctF/83jc4a7Z5baIAwiwGkM8Kr38rBeBO0S/OyVc7VVfWDJimXIYVr
	 BUIxu+kYcpscnKy0yqt9jFJrzkp6SRvOzHsQdYasFIP8IqU1kky054GfSBcvBqiM3i
	 IkTcAVg+/UI7P0HZbSIfDilu23uMhvsWLf1t6TxQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Daniel Gomez <da.gomez@samsung.com>
In-Reply-To: <20250123-fix-generator-type-v1-1-1e76428f9872@samsung.com>
References: <CGME20250123132902eucas1p19b0ae0230e5ac0bb0ce07d523f9a63c1@eucas1p1.samsung.com>
 <20250123-fix-generator-type-v1-1-1e76428f9872@samsung.com>
Subject: Re: [PATCH b4] fix Generator annotation type
Message-Id: <173765360859.64523.8052560503276149675.b4-ty@linuxfoundation.org>
Date: Thu, 23 Jan 2025 12:33:28 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-d23a9


On Thu, 23 Jan 2025 14:28:48 +0100, Daniel Gomez wrote:
> Generator type arguments in Python 3.12 are not set to None by default.
> Set them explicitly to avoid error below in distros with Python 3.12.
> 
> Error:
> ./b4.sh -h
> Traceback (most recent call last):
>   File "/media/tarkir/dagomez/src/mricon/b4/src/b4/command.py", line 10, in <module>
>     import b4
>   File "/media/tarkir/dagomez/src/mricon/b4/src/b4/__init__.py", line 2784, in <module>
>     def git_temp_worktree(gitdir: Optional[str] = None, commitish: Optional[str] = None) -> Generator[str]:
>                                                                                             ~~~~~~~~~^^^^^
>   File "/usr/lib/python3.12/typing.py", line 398, in inner
>     return func(*args, **kwds)
>            ^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.12/typing.py", line 1482, in __getitem__
>     _check_generic(self, params, self._nparams)
>   File "/usr/lib/python3.12/typing.py", line 304, in _check_generic
>     raise TypeError(f"Too {'many' if alen > elen else 'few'} arguments for {cls};"
> TypeError: Too few arguments for typing.Generator; actual 1, expected 3
> 
> [...]

Applied, thanks!

[1/1] fix Generator annotation type
      commit: 72c9a8b233f872685f5490dc31d24b78463628a4

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


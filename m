Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343AB36B92F
	for <tools@linux.kernel.org>; Fri,  9 Oct 2026 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533314; cv=none; b=lD1c9kJK8Zc0e3zf0J9oicFB5T+1rtznzArGTCzRDBCZ9yi3o/TKfZ5BVM2JFj+fSC/MuEFaB/9O5dr08LDbYZ/jP3rd/yOS3OPQm1TubUtJK9JpXWlF9ZEupXFi2jzn62lWUGSFXAKcmAcTXiuo2wiWTcSbQoe3Jva0WjebS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533314; c=relaxed/simple;
	bh=56uYKFyuJxYUNQYPmxtqTNUxBIbkn7inW2vg6PhInU0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Cf6ec8JSyPEv+k+MjTZ6/AAVWOU/MDb+ND/PO15k2e5IWNzG3dx24xFFd7b6iz67mlz/CgcVp+9TOgdG/htRUO360zusp45poQqxwMUDSgJ2cJMzxCFeWrYzSScqB1hdzge6VzFCwvnSQ40fJZ4DqhhzsK4D18EReJW1BX7hQW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TU2ONA69; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TU2ONA69"
Received: by smtp.kernel.org (Postfix)
	id A7A791F00893; Fri,  9 Oct 2026 08:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE751F000FF;
	Fri,  9 Oct 2026 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791533307;
	bh=O682ZA654NsvXwF2Bs5+sEyljPfUXfUgYpk34YXBGsg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TU2ONA691YjDyBq2SDES2S3U84JH/sXzyP7tzEjGSNzsydiAGVHFGA5wV27tA/EhJ
	 WOJeSpSKN3Ts54DQNrM9oZRypgNR4PNUAIuicxi6S4YdYLem/mxfQHEnW5y+/YoHuR
	 +qKaKPehlHFRK0rhs3r2WVjLmR4J8pOEcB6wCaEE=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] review: Generate thanks commit URLs for known
 repositories automatically
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <20260912105809.990519-1-broonie@kernel.org>
References: <20260912105809.990519-1-broonie@kernel.org>
Date: Fri, 09 Oct 2026 08:08:23 +0000
Message-Id: <179153330355.3606960.15560296869128194585.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=56uYKFyuJxYUNQYPmxtqTNUxBIbkn7inW2vg6PhInU0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJOLPiZUVVcqhLpEXKhSGPux2WNe9L/35mrstpIIGaHu
 l5Z9waGjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABNp12Fk2Lm2N+L6juZF+dNm
 tZib3bb1eae+b+We2PyZMpp2mzdc+cnI8HNFAX+lue2+L0VXKqdsEjM7/s5T583piTtemU+MK49
 awwoA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On 2026-09-12 11:58 +0100, Mark Brown wrote:
> At present generating links to commits in web interfaces for inclusion
> in thanks mails requires manual configuration of a global configuration
> option b4.thanks-commit-url-mask, or the per remote equivalent
> b4-thanks-url-mask.  Given that we also have the b4-check-repo option to
> configure where to check to see if thanks are ready to be sent and
> practically speaking this is likely to be one of a very small set of
> hosting providers this is all a bit redundant.
> 
> If one of git.kernel.org, github or gitlab is configured for the check
> repo or remote URL for the branch then default to generating a link
> based on our knowledge of the remote, a manual configuration will still
> override the default.

I didn't take this directly, but I did work it into a set of commits 
that expanded this into a few other affected areas. It's largely based 
on your work, so I added a Co-Developed-By to give you credit.

Thanks!

-K

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

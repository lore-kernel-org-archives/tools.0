Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD535F19A
	for <tools@linux.kernel.org>; Wed, 22 Jul 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730540; cv=none; b=lxn2ju5rHqRqrQyu1+mieu5G2Zhks7UPu43iu3lrnvg0/46Tk+wFjuN8LVVHpDznEEUcgW7F9GmOfB4+sjIoqyRFyszQevooKucCpj3BC8f59mQjjNms9oX4yWbWmdQ38699dXVWn5Apal44hCIIrl0T3HH7uxP+CnFukgJxttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730540; c=relaxed/simple;
	bh=IwcCB35Wde8+fX3p4/OixI9PHFbr9XehGZPggTmrSYY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CwI4elbj1C4Fmxjabll3GgGf2r4RoQCrfPSi1as/n0L/A7ZAyD8riegqUpZP1jjAzlIZgBWNTjp5dKhcfIgpHLWz43zj+yAdEc7hQwpWLhrl9RLwE635qhTC6KSVwvUbJzBDjIigFJ9YfI/9dTQjpgzZlXKyDXlX+VVmRljsS5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GpHgi5SQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GpHgi5SQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C891F000E9;
	Wed, 22 Jul 2026 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784730538;
	bh=/64kEfs5sh8oJRYdO/+xitBpoRed74UsoC8t+bxVNDw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GpHgi5SQyrZXyl3o12PaRS65rbXblcqTE/DydSJpoxp7/iTcbLlTTjU3xTAR4BLCG
	 8hSccTADgxUUuRN/ciJM47cmO2MS9kPCeSlQ7JV+Txqw5YIxfZImp38f9Ep59u7cYW
	 Shgt/so/ppnZNEXTltmx1GkjLcy9DDdlOpbFVfvc=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: b4 review silently freezes on patatt fail
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 tools@linux.kernel.org
In-Reply-To: <alN2yOZmbl31BfVW@lucifer>
References: <alN2yOZmbl31BfVW@lucifer>
Date: Wed, 22 Jul 2026 14:28:50 +0000
Message-Id: <178473053024.2193472.16225033826477527933.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=IwcCB35Wde8+fX3p4/OixI9PHFbr9XehGZPggTmrSYY=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLISLq+stjLetebepmXWrW4NK3lbXP5oT3jU9t+g9Oy1H
 qP9bpXZHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACbyRZXhf8LufgetO/WPs7Xv
 PtYwE13FdEGQ5/r7mlmsb+9e3vH1XjUjw8sFVfpXFktx7r21W2Nu+H6FrorFsqWKNnnf4z+xn7p
 3gRcA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Sun, 12 Jul 2026 12:22:27 +0100, Lorenzo Stoakes wrote:
> Hi Konstantin,
> 
> I noticed a bug in b4 review (as pinged on fedi but better to send the bug
> report properly :)
> 
> So I had an incorrect configuration locally - my signing key in git (git config
> user.signingKey) was set to the wrong one (the old, revoked one, the one
> I... err... lost the private key for :P).
> 
> And with this in place, I was using b4 review tui --email-dry-run to experiment
> with composing a reply.
> 
> The replying bit worked fine. But when I hit 'S' to send it froze up. No error
> shown, just frozen.
> 
> Some strace's later and I identified that gpg (of course) was to blame - it
> seems the python code just hangs waiting forever (idle event loop looks like).
> 
> And it seems to be when it tried to use patatt to sign my reply to a mail, gpg
> failed with exit code 2:
> 
> execve("/usr/bin/gpg", ["gpg", "--batch", "--no-auto-key-retrieve",
> "--no-auto-check-trustdb", "-s", "-u", "130EC0891A27271B"]) = 0
> exit_group(2)
> 
> (I can give you a full strace if you need!)
> 
> I confirmed this was the signing for sure as passing --no-sign fixed it.
> 
> Once I updated my signing key to the correct one, everything worked fine.
> 
> $ b4 --version
> 0.15.2

This was more of a rabbit hole than I was expecting and required a new 
patatt version release. The underlying issue was actually that gpg 
invokes gpg-agent, and non-zero exits from it caused a hang due to how 
we were handling pipes.

Anyway, I believe this is now fixed and shouldn't resurface.

Thanks for the report!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


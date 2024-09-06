Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD751CE706
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634998; cv=none; b=LQ9/coqbVEbW+rKVf0S+0WWxBWI91jY9t/VAtnnabfuH7vt7BW0sKbGgFwPOhsnCb9LzgEav0eTK73/PzQK4wI/h85sKFd2815NzJecuF9e9Kuw8aHhSrkteiWFfHcO6u8TyljcK9pHnfxjnd1wh2lOR3rcCOF/AFtlnAg8FkmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634998; c=relaxed/simple;
	bh=2o9olLSvBmjB6IOAGCQd25yCh/diQQmoTqA+XPY9mRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jO9p5ZspiNPFEJxf1y7NdZje+dMlzQ8y12HFdRz5pqKouIY8ZQDYDsGXEHpBCjfmkaSe/IA7OYzSJkwF59n8n9tw8J0FKUBvH0CO/pffGvqRsEKMuOBy8DkG6rDtUALbnjquT2ciMM9nQHkTEqm9xmCvdJ8sGBH4mkH6/qp4YRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZEMYfvpz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZEMYfvpz"
Received: by smtp.kernel.org (Postfix)
	id 476C4C4CEC8; Fri,  6 Sep 2024 15:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72D8C4CEC6;
	Fri,  6 Sep 2024 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634998;
	bh=2o9olLSvBmjB6IOAGCQd25yCh/diQQmoTqA+XPY9mRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZEMYfvpzOLxqA6GE+1NMDxpGXsWU8ugMjT4MsSI4Nfg47s/eHraSBKo8nBpsTs90g
	 V0+5R71cRGdwyDgIPlu/3ttFujl/J0NGP+YiF4sFyek3wUd8kIeam5Ui3OJHEaS5yc
	 CxZmwXrvYybqXy/UkMkTnPhT/7Bd8IYGhmReNX/M=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Celeste Liu <coelacanthushex@gmail.com>
Cc: Celeste Liu <CoelacanthusHex@gmail.com>
In-Reply-To: <20240823-feat-use-sendemail-identity-v1-1-7b9f7d0e0ae3@gmail.com>
References: <20240823-feat-use-sendemail-identity-v1-1-7b9f7d0e0ae3@gmail.com>
Subject: Re: [PATCH b4] Fallback to sendemail.identity when
 b4.sendmail-identity is undefined
Message-Id: <172563499782.27501.9301315032796275985.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 11:03:17 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e2eaa


On Fri, 23 Aug 2024 18:05:57 +0800, Celeste Liu wrote:
> To match the behavior if git sendmail better.
> 
> 

Applied, thanks!

[1/1] Fallback to sendemail.identity when b4.sendmail-identity is undefined
      commit: ff3bc6ddb5ddfd17a2cebb67b765c00023c1a891

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


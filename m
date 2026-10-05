Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7527310652
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190956; cv=none; b=gRXLCpCSFmSIKZBsasERwaiDARLszCKtz5UPzTwvHDZ8QuoOoUWYzC5dCT1SScjUJOrZsNSMs/cHpakwF0QE7gRXDnJ/iok5/VVL4dkxJ0U1h4ZH60w3PetV7e9hxQ8GVpW/xl8WHOMUSt8ciwyYnz2fHcPpGKg6NVp4j/svSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190956; c=relaxed/simple;
	bh=/1vrQBYjOcszhMzdAyZ3FcsF8vGSh5ZvUcPEwbucIyY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AxMy3YnrcQqc7jW+xFUp4fmIWSr/IXtKee00lJwH5kHlRnWzIjrrau7yFtv4FaQJZghX6JgfIpxuZ+wP1Ro8J2s4tWBIfNp7NisuC/dV4VIK9jUTLQsnPdx2ax9h/ApvVqF3W5TgBtOruS45Y8oLsXl0VXIGpprW7oWVN/RwemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s7SjLcCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s7SjLcCW"
Received: by smtp.kernel.org (Postfix)
	id 6FBE71F00899; Mon,  5 Oct 2026 09:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0181F00898;
	Mon,  5 Oct 2026 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791190954;
	bh=arHsrZcPJ21puFD5oio0aui9OIX3mwDchTLKA45j0YA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=s7SjLcCWS0gJBr3MMr7V7n/YKrINqV6viCjlJkvoSfiFYIe/d4Jg6CHkQq0uKu2t8
	 i5b9KdN0itcWFJA486ON1UWSk4jRV08GvgGAkRVO+NmKFQvvCSusU99QhXOQAgf4fL
	 viEQYG6WrcG/m7YLJ5GCo1bUvTr+gFyf55fG9KeI=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Khorenko <khorenko@virtuozzo.com>
In-Reply-To: <20260921-kh-separate-revisions-v2-1-f7a828b1c174@virtuozzo.com>
References: <20260921-kh-separate-revisions-v2-1-f7a828b1c174@virtuozzo.com>
Subject: Re: [PATCH b4 v2] Separate revisions from paths when git is handed
 a bare commit
Message-Id: <179119094562.1730306.13912255092808319264.b4-ty@b4>
Date: Mon, 05 Oct 2026 09:02:25 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=355;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=z/4idPKox1gZvdNnx9haTRYbiBaEpULlqxh8UU2JJUU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIOpy8NLGeaqXnnUvF+xofJaqfXp5zwWRZ7X/Ofb8evr
 UcvSn/83lHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAi1+YwMkzMPKss4NQgvXW2
 0CnPpwbXom+e6PpcKPTwrs7v/X8a39cw/FORE3P68eDeIv3f+98URiRc5j+kU3HvbM2P/iJVqd3
 fAzkA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 21 Sep 2026 20:23:04 +0200, Konstantin Khorenko wrote:
> Separate revisions from paths when git is handed a bare commit

Applied, thanks!

[1/1] Separate revisions from paths when git is handed a bare commit
      commit: 255f9a6f87df790845e6271a6c532ef991171f37

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


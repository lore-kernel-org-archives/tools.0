Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB937AA9F
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115197; cv=none; b=P3Q6+2eBDN4G0J7W9bsT1544YhyIfsy5FgRmV5Z2GbQqSa/m3trZULW9zY194rh7Sq2+F4p2842+4l7GRmM2Ossr8cxbkljGlxwDEkWRn9tz/c9C/Ne3fCB9mvhJz4Kf1q3YMQ6OdNRixcnZTg5uo8TBOBvCBAUdZ8LLFikOhw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115197; c=relaxed/simple;
	bh=F2EQ1m6WHV2Sna0fCHQ5DQ4TMn4CuIxR/A/DfrBmD1M=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Rg9F3VG1otCPsaZ3Tk/Cm2FAXaMYKWN8G1PvZSk8l8g4TrxvHfXJOFS5lSG4qnOVfRGGSfN+gsQrzOUBrtr6iSxPxIjAZq0NU2OJidEhVGPKJ/LZj0gdE0g3D4iKA3v77n/Dl778abvdf0D1qY4XQAbPMDZQPSIR8Y6d4eRU1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UEPB4KXL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UEPB4KXL"
Received: by smtp.kernel.org (Postfix)
	id A4981C2BCB3; Mon, 13 Apr 2026 21:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA3BC4AF09;
	Mon, 13 Apr 2026 21:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776115197;
	bh=F2EQ1m6WHV2Sna0fCHQ5DQ4TMn4CuIxR/A/DfrBmD1M=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=UEPB4KXLoes1J/He9BIuXHsEL2jkTzlfn+ylY1dFDNzsKv7WeEGwt2kfPtcpTZAc7
	 jru/wvxjHdq1mjtshMIhoNsovQPCrzdgHABKE4fggpL0lB8m0upP6We7POCZ8maLQA
	 nvx7yYMksTPwxki9qd+5hSAe8BzIwDVB4Rq4NaaE=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/14] Update README for uv-based dev checks
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260410-harden-type-checking-v1-13-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
 <20260410-harden-type-checking-v1-13-fcf314d9d748@gmail.com>
Date: Mon, 13 Apr 2026 17:19:40 -0400
Message-Id: <177611518001.749969.16166025327956174319.b4-review@b4>
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=610;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=F2EQ1m6WHV2Sna0fCHQ5DQ4TMn4CuIxR/A/DfrBmD1M=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDLvxv4qEPecvkiUsXTj+WcHuk3Yjm7ue35ka57W5Ll31
 jGubEr931HKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAizjEM//23Gb7b+zqM+bcY
 3++9bxxNegqft22/HKsSPzH96hd1yX5Ghn3v01njS5vmnfwtuj/qrmNNmNKLpVNm1vQbrpj5sOf
 jDl4A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 10 Apr 2026 18:38:04 -0400, Tamir Duberstein <tamird@gmail.com> wrote:
> diff --git a/README.md b/README.md
> index 3709d7e..2f61036 100644
> --- a/README.md
> +++ b/README.md
> @@ -613,25 +613,28 @@ except LibloreError:
>  Install with development dependencies:
>  
>  ```shell
> -pip install -e ".[dev]"
> +uv sync --all-extras --all-groups
>  ```
>  
>  Run the test suite:
>  
>  ```shell
> -pytest
> +uv run--all-extras --all-groups pytest

I think you want a space between run and flags. It's like this in the 
entire doc, so I think it's a find-and-replace typo?

-- 
KR


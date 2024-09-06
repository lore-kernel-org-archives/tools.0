Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA5F1D1F50
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634036; cv=none; b=RX6HDOtnq1qXts5dQUSuSr3QDo4JDXsyTsjFqc/x+r8Xzhmz0CjXURYiqP56SOF+4ZLFUppxtE5sWdOPlb4302GGHirmE2Ls4tpxQ+AfLYx1ZEMmgUqo9adYlO8aWZvoHKpiAlPsM4MjuZopcyfpadIu0HSDlxS+CVZnnUajrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634036; c=relaxed/simple;
	bh=za/sPVKLAw2EYh/M9xXmgXlVoAkCE3wSml0YsiEcuUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a1nqNXQ2sL17gwp2I8BzJOP9rh2EFcgjnxah0ADcdOgW/CevuhlqzYgk9PUig+WP3YoXU3cfCxQ+2NwUgFRa/LL8hNyEoiXcAUDlD919dFjBjr/RK7ZpzgqTsKsVOiotRu8XR2+52DnfNMZfIrft2SENa73vvUxQdbxwI1JGF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y6gOTyTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y6gOTyTU"
Received: by smtp.kernel.org (Postfix)
	id 75AD4C4CEC6; Fri,  6 Sep 2024 14:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A46C4CEC4;
	Fri,  6 Sep 2024 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634036;
	bh=za/sPVKLAw2EYh/M9xXmgXlVoAkCE3wSml0YsiEcuUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y6gOTyTUrD9Ql+bxIOe33/7lr0Q95sJWp0QYIU1MbljPHrf698BJ3USeSRTu1E6XU
	 EDyzzWNMedc4mzsa8ojscDVw4I0OBi4hTNJ3kNT6jlNjI6ymxZa6Tas7n/bboJ30Dv
	 geBmEeCP331YTriBpbqZdvARR7GQ+dYBrVsfLTV0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, Zijun Hu <zijun_hu@icloud.com>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <20240708-fix_typo-v1-1-23fd72aad8c3@quicinc.com>
References: <20240708-fix_typo-v1-1-23fd72aad8c3@quicinc.com>
Subject: Re: [PATCH b4] docs: Correct explanation for option -m of b4 diff
Message-Id: <172563403601.23316.4932034928496434497.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 10:47:16 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-40f6e


On Mon, 08 Jul 2024 19:55:02 +0800, Zijun Hu wrote:
> For b4 diff -m AMBOX AMBOX, its explanation wrongly says that AMBOX is
> prepared by git am, fixed by using b4 am for its explanation.
> 
> 

Applied, thanks!

[1/1] docs: Correct explanation for option -m of b4 diff
      commit: f24b7ba6718d09296b19979ef25c0b58c981faa4

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


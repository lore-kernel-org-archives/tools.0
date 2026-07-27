Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886F3C13E3
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180116; cv=none; b=JQb8NHQs0n5ZVwmUmm476k2PT9qu69nzhAmL7aLf6AoJymRWpEfm57e0cQMvgv5kKm6pt0k9ZH+nrHZES0NhidRTD3bBKBUyEGExZDZofufXeMbO5jR+RCon8P1a0LEkR5CKLHYygodJ4psgHXIc1rndGimp9EaBiQ2HxFXan8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180116; c=relaxed/simple;
	bh=x0Q1MV+JWB8T5iFdrooWBND0K+QWPQu2iKvAU2H/wLI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EHxtg2xBTCZ1o9ApI686JoFg4jkm7Ui37IbHENnfcVuidafVBbrc2AlEC+JwxgIf0LhDTvNygSnPMXMuWsN7ehDTgGtkqMGuyDkwf+jz+BWEUmcW2fnDkD+C8pJu2zMRB7ninc9n31PYh1PuAqdkj5LjaEjMoxl7K7VNF/X425c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QVeDTDCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QVeDTDCW"
Received: by smtp.kernel.org (Postfix)
	id 2FFF61F00A3A; Mon, 27 Jul 2026 19:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD92A1F000E9;
	Mon, 27 Jul 2026 19:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785180115;
	bh=MYtMZvynjXtLCC/QqvK2e4UADiCPikz5y3hAKoaTBrQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=QVeDTDCWF6cjr1CrkeVuFIhb/Roc+oMlCf7Tlb3tbdOVjnh+PitROSTq/6A4dfKR8
	 8OCZ7CVj1D+2gs4vtdR0CL/+wnx3P3eSl5tI4uEMYBEpOoH9wUNGV3XBJCbilcZbXa
	 Ja/e7YQupJIMOnfTSf8FObR/NfmNfsJ9MMxjTjjY=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Nicolas Schier <n.schier@fritz.com>
In-Reply-To: <20260723-show-name-of-module-that-causes-import-error-v1-1-d3c0d71834e2@fritz.com>
References: <20260723-show-name-of-module-that-causes-import-error-v1-1-d3c0d71834e2@fritz.com>
Subject: Re: [PATCH B4] Show name of module that causes import error
Message-Id: <178518011103.2787052.9787541670428688672.b4-ty@b4>
Date: Mon, 27 Jul 2026 19:21:51 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=314;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=5LTjcgypCyReDQopdVG/VbUHTaQA1F7H+5DmS+jgWh8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLS119aGeNTLbaiQd0+ct6qxCuz2dtKnZgmlG5NYHvFW
 LGg9m9KRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIns2sPIsPDComVNGb1233f9
 WeHnlnfqrdCnQ+tX/f9/6Yfkpg82vOoM/3O09oZtv5lyvanI/6nPxIWrXh50nWOw6I3HX4FfCj1
 VDmwA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Thu, 23 Jul 2026 11:43:59 +0200, Nicolas Schier wrote:
> Show name of module that causes import error

Applied, thanks!

[1/1] Show name of module that causes import error
      commit: 11fbaf0a8a17fb4a4f1f6d210f6260bd4e9e8014

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


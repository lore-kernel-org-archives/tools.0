Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3314E137C35
	for <tools@linux.kernel.org>; Tue, 23 Jul 2024 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721745081; cv=none; b=Fh1PYcZafgnyOb/SApya2VglY2L3whCvLahqEgANhSC1fHsq7Kfecqg12A2/M3dG9YxFQW86piSyzwu/A4y7XQwDqIzlpYSWo7B0xP09O/LiFV9HSo6TMdChP1wICaM36ne8mnRxVRPiSYBGwFTEa4QqbcxAadzNDtoadE417oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721745081; c=relaxed/simple;
	bh=oyaIhaCSk27EDVQtVL3xl0eyXQI5B548KH+om24fbbY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rRUs6Ki42kixIm+HTaDQEAtJvi4yZwgkaKLLqcivOur0VNk8wovdMRDeuKt/1VSd/RQmmODf+neLzFhZstQBCSHPGNTJUVTbwN9c5lWxc5iyZ3yK1IdWrMXPPrFGYKdAh+nn0pdl/4zrm8SELBGJimaGxlscgQDZZFGWB3KEKuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KS3oPxSS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KS3oPxSS"
Received: by smtp.kernel.org (Postfix)
	id CBA2BC4AF0A; Tue, 23 Jul 2024 14:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658D8C4AF09;
	Tue, 23 Jul 2024 14:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721745080;
	bh=oyaIhaCSk27EDVQtVL3xl0eyXQI5B548KH+om24fbbY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KS3oPxSSYaNpT/u0KHEEFsoFFPX9yA+zBNJHeJ0DbWWomKCZziAtmZZl/oCQ6ENEt
	 eefIObvNTAPbqJL5kSLeL00z2KY8YXGp5ZYC/ePeDqVyVgchJo1cBbAVKuWB/Aj5Tr
	 wLSlO2yivVQ34AjVdNt+DbgOsEfrt1SQuHUgh6lk=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Joel Granados <j.granados@samsung.com>
In-Reply-To: <20240723-master-v1-1-52a11f4a96c6@samsung.com>
References: <20240723-master-v1-1-52a11f4a96c6@samsung.com>
Subject: Re: [PATCH b4] Forward the smtpserveroption to the local command
Message-Id: <172174508027.137961.14549954006515330812.b4-ty@linuxfoundation.org>
Date: Tue, 23 Jul 2024 10:31:20 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811


On Tue, 23 Jul 2024 11:24:10 +0200, Joel Granados wrote:
> Additional arguments to the smtp command are needed depending on the
> sendemail identity. Append the additional arguments in smtpserveroptions
> to the smtp command.
> 
> 

Applied, thanks!

[1/1] Forward the smtpserveroption to the local command
      commit: 37811c93f50e70f325e45107a9a20ffc69f2f6dc

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


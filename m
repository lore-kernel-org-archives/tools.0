Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F43F18DF73
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 20:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741207596; cv=none; b=jY1nPFJS2cOZrS6rzmuq4ji5jQ0UcyUlf2M8FYWTPwtbvW/mXdas8JKYp8MZckiTOrgt6THvFjy+JDg65e9W4iGdhdue/V53g+tszQhqSX6kVkszqjQGbJuMN8Z3nq8OVCyPy5isoTdgDtqVDzx91vAAm1yckifIDCwUS6B5r44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741207596; c=relaxed/simple;
	bh=EioxzY2xmKG6rDrsMYo5loadjLnBTOFnXcUM2pr75HE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LfQYv12/q0qGWm/N5a1A11nzXekz+MNGxBnIFFkdSozdOvmo4V1t93mKE2S8+8/rq5p7fwnfePxxydl7Oei+MSYk2hq91rwjw+DHanioeZYuXlyCkEyQf1ZtMN8Xlx6cTn8zD0f2+5qUtvigJ9ZAyJO72ENWwE8DioikQL/LExw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DCKPIDaB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DCKPIDaB"
Received: by smtp.kernel.org (Postfix)
	id C66FFC4CEE0; Wed,  5 Mar 2025 20:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676F4C4CED1;
	Wed,  5 Mar 2025 20:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741207595;
	bh=EioxzY2xmKG6rDrsMYo5loadjLnBTOFnXcUM2pr75HE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DCKPIDaBtoDWBitTdB998TJC2Hv4X8YOwgBbfI+gHIJmxhtu22aLyHabuxSh+BzTP
	 vBcpyCfG+PEMKN61ek1rbTPJZOS8sI2b9WT7JRxAch8RxPfsUfWpNwlpbhq5lybemp
	 l4HiYLMT66t9NgaUVz1cJ6ZjDKosz5g4NaTk30fQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250304-creation-factor-v3-0-d6515180b7e5@bootlin.com>
References: <20250304-creation-factor-v3-0-d6515180b7e5@bootlin.com>
Subject: Re: [PATCH b4 v3 0/2] prep, diff: support passing arguments to
 range-diff
Message-Id: <174120759530.1890477.278195489824587234.b4-ty@linuxfoundation.org>
Date: Wed, 05 Mar 2025 15:46:35 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1


On Tue, 04 Mar 2025 14:00:28 +0100, Antonin Godard wrote:
> Add --range-diff-opts to diff and prep to pass additional options to
> the git range-diff command. It can be useful when the output of git
> range-diff needs adjustments, such as modifying the creation factor.
> 
> Examples:
>   b4 --debug prep --compare-to v1 --range-diff-opts "--creation-factor=80 --no-dual-color"
>   b4 diff --range-diff-opts "--creation-factor=80" 20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com
> 
> [...]

Applied, thanks!

[1/2] diff: support passing arguments to git range-diff
      commit: 3c7fbc395fc6599c83cb6c8cfc796c9ee9ab43f0
[2/2] prep: support passing arguments to git range-diff
      commit: eb4a66b12bc424854f453493dc627436952b3573

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


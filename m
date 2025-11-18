Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2DF27F00A
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763496271; cv=none; b=nnxb7bdprWMy01NpkGioopTdueJdjsdtPCaIr7vTV0OlzY0wMPOMJwIuUqlnEpW5OcKnVOdKrktSFPXExE47kC9v5UC7Y741gbIHDVo1YIBOww+k8fVqWBm5QGMjioXoi2eLZJLv2qDysrmKhWkJ3KsGW2MlyR9KBDqMhhEvy4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763496271; c=relaxed/simple;
	bh=0WIt6u1q5alKjfHL5ovoprJecadsioRS+dhEbZA4cSA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qZQkJvqYoXMqIIHVeMcoHcoGOyuQLVZDq9iZ9lZNgXgXoio2Dq0q7TSgtf8PUc3rPhywiKrrduVEaWRGT0+7lV/pwzH+hv3RmvIKINITrRYukrYhyoC2xpg+EXYkhr5dYu+llnNkZBrOp+vqEcINkzJoik9+2Yj+C5a08nEG1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eyF8d7Hn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eyF8d7Hn"
Received: by smtp.kernel.org (Postfix)
	id D25F9C19422; Tue, 18 Nov 2025 20:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70AB9C116D0;
	Tue, 18 Nov 2025 20:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763496270;
	bh=0WIt6u1q5alKjfHL5ovoprJecadsioRS+dhEbZA4cSA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eyF8d7HnT3aQEGB+zqyBeEbHtcNFr1TL0aHQ0viMyKj3e/DnVVFSnLhI/EbJK6efa
	 8+JkudQl3NB2UyYXOlXiQbV9xIeJU7UoZovxeCiV9PbgJrYbwp6T73KY/PkLqM6AOQ
	 oql6Rk0byMsA1C8xt6hyFbvsOkqYbldWsM+SU9UM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@gmail.com>
In-Reply-To: <20251118-bump-shtab-v2-1-6bb1e2f11d8a@gmail.com>
References: <20251118-bump-shtab-v2-1-6bb1e2f11d8a@gmail.com>
Subject: Re: [PATCH b4 v2] Update shtab requirement to >=1.8
Message-Id: <176349627021.1889060.4517155778005380202.b4-ty@linuxfoundation.org>
Date: Tue, 18 Nov 2025 15:04:30 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a8dcc


On Tue, 18 Nov 2025 14:54:45 -0500, Tamir Duberstein wrote:
> This release fixes tab completion in zsh. Bump requires-python to >=3.9
> to avoid warnings caused by shtab requiring >=3.9.
> 
> 

Applied, thanks!

[1/1] Update shtab requirement to >=1.8
      commit: 9c26a0853b500ab60f27303554a6079bdc981397

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


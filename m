Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C74C9F
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737561034; cv=none; b=AuoJDwi59VUeMNVtU37btzQWyEkJKy4fOqqFDOpCtfkYwHkO1ld2FJf6pkwHskFKdSgKIfcvNqqrL/BaQ3t2I+k9mNwDeH4u3dtlLZAj7BLFEOThPfBY0+p2ui0qii+KWrnXS5FDDZ5c+AsPMScsZPaHuWc8t4pCfzFoO2Ks6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737561034; c=relaxed/simple;
	bh=rYxLfv80f6uGiKFZmZ1DbPzN4ljKkXEY1hu5sO/vBog=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Oa2vCPQtHKIN1j8+PRzpLTJuS8taNPDou2fGGoVRAD4AMe2DGVtxxcwvi4oHCCClOHtutQwTr74tXyTml3lgWserwfkxhJdituHRvJkZ5Q56/YlD4cU/mfIBj82gsdDcwLSochCHj+sKvfY3xaTlhB9s+8hfDsmlLePbPQ9vS2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kkYr0gfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kkYr0gfK"
Received: by smtp.kernel.org (Postfix)
	id B2C4AC4CED6; Wed, 22 Jan 2025 15:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616B1C4CED2;
	Wed, 22 Jan 2025 15:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737561033;
	bh=rYxLfv80f6uGiKFZmZ1DbPzN4ljKkXEY1hu5sO/vBog=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kkYr0gfK8eCzxjoHWW86NCoEaurGAhTHcHhDPQ4cp9v8Q14M39fwvAeEybqcRIrDY
	 7rl1U22XFFyEHx0kdxW8BUpnuzCUdSP4y4UMcfgFDY2j/bTkbV4c+GEMGhyAsFCTqk
	 C4rRHYfc8Mlz+YftgXnZNcJ3wj0OOEaUDgTIz7iA=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, Patrick Steinhardt <ps@pks.im>
In-Reply-To: <20241112-pks-shallow-threads-v1-1-79466a503075@pks.im>
References: <20241112-pks-shallow-threads-v1-1-79466a503075@pks.im>
Subject: Re: [PATCH b4] ez: support shallow threads in
 "b4.send-same-thread"
Message-Id: <173756103327.469642.7400908255233310503.b4-ty@linuxfoundation.org>
Date: Wed, 22 Jan 2025 10:50:33 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-4edc8


On Tue, 12 Nov 2024 11:20:28 +0100, Patrick Steinhardt wrote:
> When setting "b4.send-same-thread" to a truish value, B4 will send
> revised versions of a patch series in the same thread. This is done by
> setting the "In-Reply-To" header to the message ID of the cover letter
> of the preceding version. This leads to "deep" nesting, where the nth
> version of a series will be nested n-1 levels below the first version.
> 
> But not all projects prefer deep nesting. The alternative that is used
> in some projects is "shallow" nesting: instead of nesting the rerolled
> version under the preceding version's cover letter, it gets nested under
> the first version's cover letter.
> 
> [...]

Applied, thanks!

[1/1] ez: support shallow threads in "b4.send-same-thread"
      commit: 1da52b83b0af04676533e608e4bbc0aff1d6c3b0

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


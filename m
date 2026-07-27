Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4C3CB54E
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180912; cv=none; b=AiI1Ku6fNU3cZz9tYltq1qqmiH2Sw30NEfiOti4RmNvxN/cDWA8/H8qEfgqRg7yEvU3BFoAWSbDM7cmA5QrKCMvlePeFBgQVQXOdezlr9YnmdWEVJ+DvbSG30s+P4VCEmktMSgeMA/FZ56p3V7X4rLVyrPnNXkvlNOSyQUP1s2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180912; c=relaxed/simple;
	bh=VO5SKluszSHBZNbLEV7o/vMV0BehVgBihlGYvLS2Xcc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V41RNyK1nh82tIbN1QU8qgRkuabYVH1R2WZTBAInG/8UrevzbhIVUdr4U8W0I1A/brcVUMCBuiSJXpkMXU/HdlQJPb8d+qmPy+s7io3EtSgpZAxc9CSgckw3Bgf6qh4awEG09ZeF4tfDc/2jI1RH1dRu1LzoB521b4gv5JJAURg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=trGxHzmk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="trGxHzmk"
Received: by smtp.kernel.org (Postfix)
	id 5F65A1F00A3D; Mon, 27 Jul 2026 19:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199CF1F00A3A;
	Mon, 27 Jul 2026 19:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785180911;
	bh=g3Z2cxy7YpAEGEgFc41Soix1qsYRgtMYIfPdaJxXe/8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=trGxHzmkzf6gwslpMI7PYM6ZI9IGClr5Y5FnPWTPHFgBJP8OE19tg05TTaoQde+Cm
	 0TMMn3o+u01XHZ3hYoSl+jd/yv2TJBcCCbOSRh4x00IBViYN+4tNPAMVR+CWVVBs5v
	 dDeHwYLzgv7dawrKmZ8O1JXyJ+fb9cnPh/PHOiQk=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260630-review-tui-null-series-name-v1-0-67d7c9334454@kernel.org>
References: <20260630-review-tui-null-series-name-v1-0-67d7c9334454@kernel.org>
Subject: Re: [PATCH b4 0/2] review-tui: handle null Patchwork series names
Message-Id: <178518090729.2892443.16354282025890216859.b4-ty@b4>
Date: Mon, 27 Jul 2026 19:35:07 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=802;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=v4k8fiUWV+zhO8ldYW5NKQwMHfZC1PHm6AvpsEly5uo=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLSN7079iZcsnDStpMaB88Vci36GW6wd+cPfR+Bf88Dl
 qqVak0611HKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAiL74z/PdMsZJmnCDUwBUl
 EW/Wf7NeLLhx8YHzjx9a1+bk7vmhVMfIsHnenZq8b3J8TIxt7qsm8O5kP7fVlvMM99bLc65MZ77
 CywwA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 30 Jun 2026 15:41:31 +0200, Christian Brauner wrote:
> review-tui: handle null Patchwork series names
> 
> Patchwork returns "name": null for a series posted without a cover
> letter. The review TUI's Patchwork app read that field with
> series.get('name', '(no subject)') in several places, but the dict
> default only applies when the key is absent. A present-but-None
> value passes straight through unchanged.
> 
> [...]

Applied, thanks!

[1/2] review-tui: fall back to '(no subject)' for null Patchwork series names
      commit: 25a3798675be8a6622f59335c5ef7a8d9077643d
[2/2] review-tui: test null Patchwork series name in bulk set-state
      commit: b0fae61561675f1eb013d14ae4b1cdeb07c1ad83

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


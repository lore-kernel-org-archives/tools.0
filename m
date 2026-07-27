Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C13CB56C
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181970; cv=none; b=U9d+oBsAHS/P8PBO59V0UmFeZK2+WSO6l2uFOtkPghDcNAMZcgSslcKUnmAIGCnbNKa9puANg4R40HEI+X9Xch9wuEDC1xNScdPwA1y0fB2JcHljghXZkzC4F5nwsgyihp+ygtxEzNMuClbcNTu+wWWqs8mW35y+LUtLbIosB2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181970; c=relaxed/simple;
	bh=uyP58dKBTBltEvqVM+5+a3+R3hBSULTgGVLu+1kKMnI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WfuU2YN3fk2A4WxOWB4FG3ZqhNunuvItrJCJ0Zii+C1q1kXc55zqmB+sNf0sZ64N5s9CD7BnGV4/mKllcWqqUWH1ww7+1FuHZqu8Q5ce5XG73qDulLkMGOapK+eZ7hbiRcjIeIXizHI+l1QVHTdzIqDiSaYXs+846EsAtK2M07A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=14DW8vcL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="14DW8vcL"
Received: by smtp.kernel.org (Postfix)
	id 1525B1F00A3D; Mon, 27 Jul 2026 19:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22C41F000E9;
	Mon, 27 Jul 2026 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785181969;
	bh=9YD3rQ0q44bKX5NDGXqG5EvEms0Lhi5dsONfMlcpfw8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=14DW8vcLr4YIuQ5ujfpVmKtR0Xe7Qcltyk2iLylxApRzelvhRjqrO9n91bVR7o52H
	 Rasx4Cbq0JsBPsw/MUXW8B1s38rYi0vzgBjSVTr+PPaaDWGVzLw/ntozCnxMCVO+jB
	 SdtruDRTtV6zs3CUXKeenHqSv3QwsFRnJuJBuQCQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
References: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
Subject: Re: [PATCH b4 0/4] review: keep the unread badge alive for applied
 series
Message-Id: <178518196482.2892443.9399136164051265724.b4-ty@b4>
Date: Mon, 27 Jul 2026 19:52:44 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=5OR5CyMNhyFlaAVSC1/s0D3zt7dWotGY+GYGIzGx7D8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLStwvUGntWBlg02amFiTAy2O9JNjpz+nGys+D5i0n+u
 XX8xSwdpSwMYlwMsmKKLGX7YjcFFT70kEvvMYWZw8oEMoSBi1MAJnI3lZFhidyNHffaxAR2m5Vq
 cfwqSRJxnBU/8c95lV/XXOpn3XxuxfA/7OflqzdMjvq8Ug2e/dTRb6cIs0pkeJXDxHkB2uf/T7B
 jAgA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 21 Jul 2026 22:21:00 +0200, Christian Brauner wrote:
> review: keep the unread badge alive for applied series
> 
> Pressing 'u' on a tracked series fetches the whole thread no matter
> its status, but update_series_tracking() refused to refresh
> message_count for accepted/thanked/snoozed series. Since the unread
> badge is message_count - seen_message_count, new follow-up mail on an
> applied series never showed up in the tracking TUI.
> 
> [...]

Applied, thanks!

[1/4] review: keep refreshing message counts after a series is applied
      commit: f91f8bfc5b484aeccf3c4689b602bfa02bb6ec92
[2/4] review: test the applied-series message-count refresh
      commit: cd197cbe05012faba052db6b7df550f0e92cbd76
[3/4] review: drop tests for the batch message-count updater
      commit: 84155016c469c333cd25ede1231d9e7f12586f2e
[4/4] review: drop the unused batch message-count updater
      commit: 573d139df55fab7501061332948c466c57436d4d

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


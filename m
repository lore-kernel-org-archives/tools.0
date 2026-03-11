Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053063DCD96
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243443; cv=none; b=ppc++xc7uorx8tdip828g7iSg+K0suX3oebYsx7f1Gl/5JiSiqhPldEUYuYsX7CzGYsMgQpK6PXSFb9BSXgmE1HKADTjfXJ8ZED1XKXktvhKI6pBoat3Nf6Uda0av6OSKgLzpwFZAGZw56us8kmFqBNyu6ndrUTKIYwtztXAh2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243443; c=relaxed/simple;
	bh=Fxd8+FRXoGUEViTcycUlg7HJIuXOTaklwpvGz5HrjQI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ef+WJ5M01hkLrYI9OJmr3SSOpXH1UsAbue1a/pkiq9NoOJZGiJQY9IZ8zDneysMF1PzS5sPvWnEzgW9InNS7Je2p/MqcatohpU5ajEhRujNkQT+3hG7+gBfvAIhYqDrvcgZfGUDYFR1GnJgG33oxz+D2LWtmjm/LSb0wuIxHAEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Txx/S5pP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Txx/S5pP"
Received: by smtp.kernel.org (Postfix)
	id A95FCC19425; Wed, 11 Mar 2026 15:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F06C4CEF7;
	Wed, 11 Mar 2026 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773243442;
	bh=Fxd8+FRXoGUEViTcycUlg7HJIuXOTaklwpvGz5HrjQI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Txx/S5pPNakN1YR5gpdOgHCF7kkI9V+8LDzMPDjr/mPRfGdw3uBipc4Qt8jjbrWvW
	 qXAAu6uRGO8WDzUICVjzLLlwIymw9QbZ/9VX5Fgn+naoHIzrfY+XjLF0TUvUvyaVZ8
	 epWeksB4e8oAYt1G9U+tfZOtDL9gsHPvnjqXfPzw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
In-Reply-To: <20260310-review-reply-msgid-v1-1-3deef033dd25@kernel.org>
References: <20260310-review-reply-msgid-v1-1-3deef033dd25@kernel.org>
Subject: Re: [PATCH b4] review: use mail domain for review Message-IDs
Message-Id: <177324340029.718772.14092063496615407776.b4-ty@linuxfoundation.org>
Date: Wed, 11 Mar 2026 11:36:40 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cba5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=269;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=ZEIlMPDXS34dnaSZqcNWW/V910TQ52RanCr13WpTuvE=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDI39hhedPYS6f33ss8nS3a3f7H1nhsGE2fINR/wfukuv
 ebigQUyHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACZSc4+R4ajACc4zRoc1F92K
 eeSa+bDbZvn2H8e9fsvJrLXM+mC2PIuRYc/WPVeXi6st5lsdruJkfFU3eMUJvmntxuHp8+tf7d5
 eygUA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 10 Mar 2026 13:31:30 -0400, Tamir Duberstein wrote:
> review: use mail domain for review Message-IDs

Applied, thanks!

[1/1] review: use mail domain for review Message-IDs
      commit: 7ae850f409eb72ad25e55ea0fa283bfc5efa5492

Best regards,
-- 
KR



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794380363;
	b=0Kp2A3MgFEJ5H9SwF/42cEY8ixkPCbfhLaCLnM45/t2sS205k/HMB3oLU0acsAs8Vfhn
	 UNabQgfWGZQ9ExwrPeeudckHHlQIGXuIxZY6g1lePchEE/cn4N1BrQmCFFUI32kxVcj+c
	 iD+bjSX98woWSD9z1wqIPO+uZYdFPk55sWvJh7hw+cH/wAeI+VH0LSlmb9NCJbIdK2GUC
	 6GhIyks1gR5kc+slhmuR/EtEQmRbZwvJ27qzEtzR3FUlg6MHY8flhGAJWdnqOTkLKYTwL
	 JWjsLty/oouvDiPPkKPBUeO1fz4zyR33WPNi4+86LHAy78XwyZjcYX51YBA9jq6wPIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380363;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4/oCj2EpBCH3hfJVY0NmVbencU/P7P32GE9ny+YuEnY=;
	b=Vvk6k0L9QCDYrABsEUNpEOOMMBra+S7khMVqUhTGV3Ios5yghX7eQ/F2qdpIboA10jxc
	 TVMEh9IHQ3M3cTpzi/+zvziTUZvbT+Aw+humH76VvPygVflRxMJt0a6VDJZJEXg0aIyzB
	 P+iLQKWi8yvZHGWOl1ZnN1tEu+Fc99vXwmQ7U3KIIFwJUYhy+iZZfBSh7bSF1xohudekS
	 GZLnPLY9lCAuLR1UJBOq8Ip4m06IUhkndUcHeVMRJSRM/OF31BsUxYzocKZIxdZi6lXwB
	 U2ZuEVyocf03nYCj/54GnirTNUKtStJrVXEPcX5aUqaaO0sybnvxgpiwrjDf+g36DjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dj0GKRVo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFC6606A321
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dj0GKRVo
Received: by smtp.kernel.org (Postfix)
	id DC6431F00A06; Wed, 11 Nov 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794380362;
	b=b9CQ3Cno6mqWuE79tq/SOONMAmrVXPn8H2hhQPPsfy1OfHFBilWWhgDilO1nN5KSRmuX
	 z/Is9Mq2zEUekQp+DEntCczarOQrEIxwGENIFk0OUnXEtmGCNCFlMymi/WiQ0E5J5dTX9
	 NE0vSQhSVC63fq1UODBTuLVO6eZVJYq4j7I9CcgvF1QfId8stQc6p4kMyE/LzxKUyREQq
	 r41a9DYvYSdn+Mk/R7tz3J+knXDEVRwLvGNQNbweU5E9H2a1He6RclqMVeiHMdVo0IEea
	 VnY4CqCCJP47EYh2IWrpf5M2fMb3rUbHeT5lpAjG1wRsRMu/k6MhGTfU/1SX/DG+dYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794380362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4/oCj2EpBCH3hfJVY0NmVbencU/P7P32GE9ny+YuEnY=;
	b=bRLz9fBVRf67wMpkyHxWDBZqTYJQtp257XI9zn3bxbdtrl5XmTpZzd6FFuSUsa0PjF19
	 TAsAfniYJBiKfGgnkKkdyCQsVIK8EQt8XM6nT/btukXoTFzQCtwLezDOB4Kuv5Q8vgclE
	 DsVQKoL7NsAc5LYOzZaCVQ2xftC4dUOcb27MF44wtyA1reckmzTTmkjVPfidF41d7g6CL
	 R/+4+1UpsYJCdC7v76hA/5Skg9akYlhvZoOYBZXfmaaAzsZnot62lilxOXMUf2l056mav
	 wg7cuUME94cW/0d2br7lul8JsgyBjUCYd0B7iQ+DzBrZpsYxUgh5A5DMzG1LL6NCLmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dj0GKRVo;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 438D71F00A05
	for <tools@kernel.org>; Wed, 11 Nov 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dj0GKRVo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 438D71F00A05
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso1694866c88.0
        for <tools@kernel.org>; Tue, 10 Nov 2026 22:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380361; x=1794985161; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4/oCj2EpBCH3hfJVY0NmVbencU/P7P32GE9ny+YuEnY=;
        b=dj0GKRVom3hb8A1Tz7cJRWCneBMRTd0zMPKLQhocka/SoSHxjYktVCeCR89+frTT8S
         XkK7VhsGywmEYp6Y0nDAebfMT1M2s//8qpag8heE7aHDG+VGHGHz1sVP1kxJBtXjCQtE
         LtEE79v2IRJsNp4ZoGVsC0qOoQNxc3WgO5y/kCTWchW9vcbgr+L0lF5nh+Bt+X7hFSHL
         2lMrfJOhpPzqX1px1OsV0170QggQshUIzxlANq/MjESI50+m4iqJ0tF0c9FoxCDJ2Yf5
         g+Ac1mI0E+g11jl7bkc8Lc1EW5FTfz4MjujtaVz5k1AG317nLauIJEqtReS+aF5WnaQf
         9TeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380361; x=1794985161;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4/oCj2EpBCH3hfJVY0NmVbencU/P7P32GE9ny+YuEnY=;
        b=ujxOhA+4vr0YLnQqryc1tZAIfiBf0VmskoedPcpeUKPqdkPX0zDutTyA11XnqGkSbr
         3IyfJ5ZBPh2Lj7KFfBaM5010iVruiNVRrpcShbpVPT8Y82i9XAeVIBLLCAnTkIG8bB78
         jmdzGrNsrIVOOopdxN8hREbOKLKX7dprAm3T3Q19mnngk95uVLOfFaYwo7sxo214ae8w
         yEsZJn5FqYkETONFYFb5NDBgcMfFT90mOX3yEAV9T+uen0hoRDmssGVGGxgsptoK+oWq
         85pS8wDYhTTACN1Frc7er9V0Y0bobud1YJNC7ya2iZWwye9CZgT7zT3nbhHo/niFidnQ
         kxSA==
X-Gm-Message-State: APuU4Z/9qqt5TWpc+KP2jbaSqym73FBCeYfD9LawYwOEW7C7bRVDugzY
	4kDFQKmZi0G+d/gwu5iHfzjOoOA9djEadAIZ6hKRztzb5DSP953MjbSqv6v8QA==
X-Gm-Gg: AYBFou1EVqcCnzgmPi4wGo5bYaWAQx06u8c48/SiFTlB0qobol75GpsI4x9dXsrI+uU
	uGq3QAE0n2emlpDt76BeIsPIyzNBFNJoOBAwVkY+5Bvrtk4EU7ZZoQnNrxv+IHWvjkTvagWjq3X
	Sy2DWN5Ukbf7i9H7S7+Bt4Ix60TG5FFVGaq6aJ6opEo/MHTxrNXZXguXuPjn6TVOu5P4z+P5Bc3
	N5qXFt3dNKd1oQYbkfh3a40M/j6nQsB2k+112OBgds0gtW2JYsHP3IJfw0w0fxZMBAyxxwobvqH
	UY/uyP89oVC4sIQMiaLTww1RMHWa4TPzBt1HscjmuKZobgLRsrTk3SA3JXzwXxfuP80M1YDGIlk
	5efWLw8iisKIbV3H9PTBl1YyGMo4QyhIoI61LjZIttECU9l3AXn1gQ4C3Z6U3q/9BI2+Z0ykqSS
	eiWXpk6mYr6+jgEptl55ZCgldxog6kJeurN+tgdp5sH5S/ZfTYCa93AMB5z66WnjYeRfQ48Xwvt
	HBDRDTfguMMlWxdaj69H/ix1dk9Hg3neMEWsLNMaNHeGbYEoovTwM3uHbifaSIuq/hMYd4YtG3h
	guZOtKnee/zwhXCddD/7VF3n2M8txpvGm4/TVpylU5ILAgrx5ggidPPxrsydW3CsusFI77h3UEA
	8l7MvPUX6vzb8uZ5bVw==
X-Received: by 2002:a05:7022:2594:b0:1b3:a8a6:b55e with SMTP id a92af1059eb24-1b3bef4c391mr2807466c88.24.1794380361306;
        Tue, 10 Nov 2026 22:59:21 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm12859018c88.2.2026.11.10.22.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:59:20 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH kgl 0/2] Add token_command support for Gmail targets
Date: Tue, 10 Nov 2026 22:59:17 -0800
Message-Id: <20261110-token-command-v1-0-a089145494d3@gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEUS9GoC/yWMzQqDMBAGX0W+cwNm/Tn0VUoPSVzt1pqUREUQ3
 920HmdgZkfiKJxwL3ZEXiVJ8Bn0rYB7GT+wki4zqKRW67JWcxjZKxemyfhOERPZvrGmrlrk5hu
 5l+3/e2AcPnheMi32zW7+nXAcJ9ELfMJ2AAAA
X-Change-ID: 20261104-token-command-2e22bf5ba436
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e56a4

This series adds support for obtaining Gmail OAuth2 bearer tokens from
an external command via a new token_command setting on Gmail targets
(similar to passwordeval in msmtp or PassCmd in mbsync). This lets
korgalore share an encrypted credential store or OAuth2 token helper
(such as oama, git-credential helpers, or custom keyring/GPG scripts)
with other mail tools without managing separate Google OAuth client
secrets, running another browser login flow, or keeping an unencrypted
token JSON file on disk.

Patch 1 extracts file-based OAuth credential management out of
GmailTarget into a dedicated google_creds module so GmailTarget accepts
any google.auth Credentials provider. Patch 2 adds the command-backed
credential provider, wires up token_command, verifies Gmail access
during kgl auth, and documents the new option.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      Decouple GmailTarget from OAuth file credential management
      Add token_command support for Gmail targets

 docs/configuration.rst        |  10 +-
 korgalore-example.toml        |   2 +
 man/korgalore.toml.5          |  12 +-
 src/korgalore/cli.py          |  35 +++--
 src/korgalore/gmail_target.py | 225 ++++++++++++++--------------
 src/korgalore/google_creds.py | 336 ++++++++++++++++++++++++++++++++++++++++++
 tests/test_cli_misc.py        | 103 ++++++++++++-
 tests/test_gmail_target.py    | 254 +++++++++++++++++--------------
 tests/test_google_creds.py    | 262 ++++++++++++++++++++++++++++++++
 9 files changed, 997 insertions(+), 242 deletions(-)
---
base-commit: ea22e7c8701e566328f197c748718cd689f9ea28
change-id: 20261104-token-command-2e22bf5ba436

Thanks.

-- 
Dmitry


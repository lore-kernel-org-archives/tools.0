Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD8D477291
	for <tools@linux.kernel.org>; Fri, 11 Sep 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131016; cv=pass; b=ZMmYbwNbN6WklVwUlD+E4Qgi6MKvbrRDzVpHHdJrqMwPqvpQ/YH6Af7czT349o0oDaPg29kDF0vWiaRhV0iBEjTNgl5iJhtujIDqVPJ4OdtUKibpnrOGDSyMuLoVXn4R8ZETgJmpkWqS751crG8tvjzMaQVQkLKR52AL/18/A6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131016; c=relaxed/simple;
	bh=TdaTbkLLJ0WvzUZ43sf84jOBiS1VRnXVGHU8cRPkd88=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pDnEOWarn32XPIohlFOw0W63lDfk8w0OoScJlhtMp1jEFjWjhwz6QXT2Ouh7R4OwHrmCT3bIh7eKwluHZaaFlpo98PK+bgatLuzCOFkgkryDuJ3NjL0c8ZfP/gHSyirqVQgYO72BGkFI2ilWUQs11Xf/XTawROWXxSuBCPhm8K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=dMZ0IuNe; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="dMZ0IuNe"
Received: by smtp.kernel.org (Postfix)
	id 7E3581F00893; Fri, 11 Sep 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.255.28.34
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789131010;
	b=icIpIsHxKwsI2HnAeEirZ1GIMF76bJ02iIZL2/5c5LlsKbJWvkiHBRovsX3KqG944lAa
	 Z4TmnaZQQvTX2OLjbb4I2GSwwLqDuNnKgco7z0BlmcGaFukzGE8EVqHvb+tqNfNpYlMDB
	 RwL3KHrefIPp5A523D5chE7t653dqkeh5s0Ryjq2XfF90+JYBRsnZZ3owZICuVFCCVhR9
	 v27MQN+kPxcvQCesaKSjF+cPLr5OZfdHy/DGXIxI7R32vq7w0eTY3Unt83Ogj8jdO475v
	 vK5dpmfcPAB1/659hNb4cgSuNWwRLdva+gXe2lsXCyaeK6J/TEoxB14b4laMOfA5SiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789131010;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:x-campaign-type:
	 x-transaction-id:x-swg-uid:X-Mailer:Message-ID:x-swg-bid:Feedback-ID:
	 x-campaign-id:x-client-id:X-Originating-IP:Received:From:To:Cc:
	 Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=5EX75JAmr5NwktBLcWC1duNQcqZNDq4gD1PmSy/YTgI=;
	b=H2s3U1KJocQ6+15/9mtEk6wDRwDDPJowOOMwBa+4El+aSnlra5KcXqUOg7udmCD582lB
	 zDD6+2K1j9WO64ux/mtzFsn8BLHt4R7f/A8y2adnK3UE+AL+Yf26xdmDXPIrXkegX8Ofi
	 8Tv494D7mW84Xs2WfdpwpqN9B1h0g/LiIdskSjXLUHSB2dM+/3NgMTKh0pjciz5NkgL5a
	 7+zFtawZ5d0mo0eT6ACG+dK71J9oGeTVDJZdDPSDOT9vPuH4PBLFpox3zvcMT5BX0AVOX
	 Olsy72mIBOPmowYl6/462zWPWwLSi9G8hdxaQCNlISXm9h0qPIJGM02TItVXnTB6BlQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=dMZ0IuNe;
	dmarc=pass header.from=vates.tech;
	spf=pass smtp.mailfrom=swg.vates.tech;
	arc=none smtp.remote-ip=185.255.28.34
Received: from prod-mta-13-01.swg-srv.net (prod-mta-13-01.swg-srv.net [185.255.28.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 487341F00898
	for <tools@kernel.org>; Fri, 11 Sep 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=dMZ0IuNe
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 487341F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=5EX75JAmr5NwktBLcWC1duNQcqZNDq4gD1PmSy/YTgI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=dMZ0IuNejZEu62KOajGkOi/TgprIueJn2DOd0OTFO9sN9oPifxgNEvpHqkfRxa5l5KSBqcw+C
 ZNWU69j2NpgdZjkjD0YN8t6GKk+32+z9Y45Scf3DyKDQqpbqCGjfj3ZnHS50vfzgK58NA2ED3pk
 d4nVySSSCTZ7cVhH+h4MJMnv0OgmsMqZGpE9EZbOr6G59F6sIEjQ9Qh8imKT1hGT3zoiTBj+FJj
 2GmrdkJ5+2SJzu0HQ8XbF0cQyJ0wyqxDclHnqZH0haE/Can0LicaR20oagANymNAspwWNiHSVVm
 NJWVy5WYLrNYFfHTI3lB+ADzFS0wGnrvixHAcRiD4XCw==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a0908494f7000c4f3.001
 for <tools@kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:50:03 +0000
X-Zone-Loop: e409a8651cc7a714276d039f653748c55b60d587211e
x-campaign-type: default
x-transaction-id: 15e8f246-e6ba-4450-b4bd-3ede442b30a1
x-swg-uid: 01-aa99a9b7-a347-4cfa-bb5e-49828f6c2516
X-Mailer: Sweego
Message-ID:
 <1789131003.8631fc262581453bbf619ec5b2062170.1a0908494f7000c4f3@vates.tech>
x-swg-bid: 1789131003.8631fc262581453bbf619ec5b2062170.1a0908494f7000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from leducb.tail4c4a28.ts.net (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
	(Authenticated sender: baptiste.le-duc)
	by mail2.vates.fr (Postfix) with ESMTPSA id 95B3781E2E;
	Fri, 11 Sep 2026 14:50:02 +0200 (CEST)
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [b4 PATCH 3/3] config: take get_lore_node() fallbacks from DEFAULT_CONFIG
Date: Fri, 11 Sep 2026 14:49:59 +0200
In-Reply-To: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
References: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789130778; l=1738; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=TdaTbkLLJ0WvzUZ43sf84jOBiS1VRnXVGHU8cRPkd88=; b=PZzIvYytfU3Yvjo1qBU2TTt87W5Ntb5gIaAmAl4M6SdPSIGRvyNNFiEac2xT5BsG6ZfVNhiUN erCi9V6FNHaCPn2+ht1vNIZt7oN3cf7UWbYBboniwpx4fTfWXHBMWV6
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789131002679

get_lore_node() spells out the b4.midmask and b4.cache-expire defaults
as literals, so the same values live both there and in DEFAULT_CONFIG
and can drift apart unnoticed.

No functional change.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 src/b4/__init__.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index df20835..e2b1675 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4194,7 +4194,7 @@ def get_lore_node() -> liblore.LoreNode:
     if LORENODE is None:
         config = get_main_config()
         # Extract base URL from midmask (e.g. 'https://lore.kernel.org/all/%s' -> 'https://lore.kernel.org/all')
-        midmask = config.get('midmask', LOREADDR + '/all/%s')
+        midmask = config.get('midmask', DEFAULT_CONFIG['midmask'])
         assert isinstance(midmask, str), 'b4.midmask must be a string'
         base_url = midmask.replace('/%s', '').rstrip('/')
         # If midmask had no list path (e.g. 'https://lore.kernel.org/%s'), the base_url
@@ -4206,9 +4206,9 @@ def get_lore_node() -> liblore.LoreNode:
             base_url += '/all'
         cache_dir = str(pathlib.Path(get_cache_dir()) / 'lore')
         try:
-            cache_expire = int(str(config.get('cache-expire', '10')))
-        except ValueError:
-            cache_expire = 10
+            cache_expire = int(str(config['cache-expire']))
+        except (ValueError, KeyError):
+            cache_expire = int(str(DEFAULT_CONFIG['cache-expire']))
         LORENODE = liblore.LoreNode.from_git_config(
             base_url,
             cache_dir=cache_dir,

-- 
2.55.0


FROM node:14
 
WORKDIR /app
ENV HOST=0.0.0.0 
# Copy package.json and package-lock.json
COPY package*.json ./
 
# Install npm dependencies
RUN npm install
 
COPY . .
 
RUN npx nx run nft-bridge:lint

RUN npx nx build nft-bridge 
EXPOSE 3001
## Command to run the application
CMD ["node", "./dist/apps/nft-bridge/main.js"]
#done
